#!/usr/bin/env nix-shell
/*
#!nix-shell -i "deno run --allow-read --allow-env --allow-run --unstable  --allow-net --allow-write" --packages deno nixFlakes git cacert gnused coreutils --pure
*/

import { $ } from "https://deno.land/x/deno_dx@0.2.0/mod.ts";
import {
  brightBlue,
  brightGreen,
  gray,
} from "https://deno.land/std@0.99.0/fmt/colors.ts";

// XY where
// X is c for standard or b for bright and
// Y is the colour
const bGreen = (s: string) => brightGreen(s);
const bBlue = (s: string) => brightBlue(s);
const grey = (s: string) => gray(s);

const arrAddFlag = (flag: string, arr: string[]): string =>
  arr.map((v) => `${flag} ${v}`).join(" ");

type Change = {
  lang: string;
  input: string;
  oldRev: string;
  newRev: string;
};
const filterChanged = async (flakeLock: any, nvTsLock: any) =>
  Object.keys(flakeLock.nodes)
    // tree-sitter-* inputs
    .filter((k) => k.startsWith("tree-sitter-"))
    // filter and map
    .reduce((stack: Change[], input) => {
      const nvTsLangs = Object.keys(nvTsLock);
      const lang = nvTsLangs.find((lang) => input.endsWith(lang));
      // if lang found
      if (typeof lang !== "undefined") {
        const oldRev = flakeLock.nodes[input].locked.rev;
        const newRev = nvTsLock[lang].revision;
        stack.push({ lang, input, oldRev, newRev });
      }
      return stack;
    }, []);

const fetchNvTsLock = async (nvTsRev: string) => {
  const res = await fetch(
    `https://raw.githubusercontent.com/nvim-treesitter/nvim-treesitter/${nvTsRev}/lockfile.json`
  );
  if (!res.ok) throw new Error(res.statusText);
  return JSON.parse(await res.text());
};

const runUpdates = async (changes: Change[]) => {
  const updateChange = async ({ input, oldRev, newRev }: Change) => {
    const prefix = `  ${bBlue(input)}:`;
    if (oldRev === newRev) {
      console.log(`${prefix} revs identical. ${grey("skipping...")}`);

      return false;
    }

    console.log(`${prefix} ${bGreen(oldRev)} -> ${bGreen(newRev)}`);
    await $`sed -i 's/${oldRev}/${newRev}/g' flake.nix`;

    return input;
  };

  const res = await Promise.all(changes.map(updateChange));
  return res.filter((v): v is string => typeof v == "string");
};

try {
  const prefix = bGreen("Update");
  console.log(`${prefix} updating flake`);

  await $`nix flake update`;

  $.verbose = false;
  const flakeLock = JSON.parse((await $`cat flake.lock`).toString());
  $.verbose = true;

  const nvTsRev = flakeLock.nodes["nvim-treesitter"].locked.rev;

  const nvTsLock = await fetchNvTsLock(nvTsRev);

  console.log(`${prefix} checking for tree-sitter revision changes`);
  const changes = await filterChanged(flakeLock, nvTsLock);
  if (changes.length > 0) {
    console.log(`${prefix} flake.nix with tree-sitter revisions`);

    const updated = await runUpdates(changes);
    // if any langs were updated
    if (updated.length > 0) {
      console.log(`${prefix} flake.lock with tree-sitter revisions`);

      await $`eval nix flake lock ${arrAddFlag("--update-input", updated)}`;
    } else {
      console.log(`${prefix} no tree-sitter language updates made`);
    }
  } else {
    console.log(
      `${prefix} no tree-sitter revision changes. ${grey("exiting...")}`
    );
  }
  console.log(`${prefix} complete`);
} catch (e) {
  console.error(e);
  $`exit 1`;
}

# Findings (design session fb592418, 2026-10-27)

- TypeScript 7's DOM lib declares the WebGPU types, so `@webgpu/types`
  is unneeded and dependency scoping cannot keep WebGPU out of `ui/`.
  Instruction and review hold that line; a lint rule is a tripwire.
- A stamped package's empty `src/index.ts` fails lint (no-empty-file)
  until it holds code. That is deliberate.
- A cold-reader agent on a clean clone found the design and roadmap
  without the skills installed (fixed in f7c43ed: roadmap pointer, done
  marker).

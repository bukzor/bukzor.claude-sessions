---
captured: "2026-09-16"
method: ./2026-09-16-003-corepack-corepack-cache-metadata-12-3-4-working-mjs-vs-12-4-1-broken-cjs.sh
---

# corepack .corepack cache metadata: 12.3.4 (working, .mjs) vs 12.4.1 (broken, .cjs)

```sh
'bash' '-c' 'echo "--- 12.3.4 ---"; cat /home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/.corepack; echo; echo "--- 12.4.1 ---"; cat /home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/.corepack; echo'
```

```
--- 12.3.4 ---
{"locator":{"name":"pnpm","reference":"12.3.4"},"bin":{"pnpm":"./bin/pnpm.mjs","pnpx":"./bin/pnpx.mjs"},"hash":"sha512.961aa41fb077da3a04a441d9f8e15ebc0c96da8ef710b2eb67bf9ee7cb0610eabd48f1fd85f51cffe73846785fa0f87c56a3a872a1d893f8446741b5cce45457"}
--- 12.4.1 ---
{"locator":{"name":"pnpm","reference":"12.4.1"},"bin":{"pnpm":"./bin/pnpm.cjs","pnpx":"./bin/pnpx.cjs"},"hash":"sha512.2e81e399d73fe8390dab25e06aa788ab7a5908248d2f5a370f82b481147a6a7a367bf8048f9a6fdb6460f21a66f0542dedb8b94ca2c8723596741920b1656d4c"}
```

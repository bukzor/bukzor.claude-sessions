---
captured: "2026-09-16"
method: ./2026-09-16-010-nodejs-corepack-775-and-873-corepack-hardcoded-pnpm-bin-path-history-v11-then-v12-breakage.sh
---

# nodejs/corepack#775 and #873: corepack hardcoded pnpm bin-path history (v11 then v12 breakage)

````sh
'bash' '-c' 'echo "=== #775 ==="; gh issue view 775 --repo nodejs/corepack --comments; echo; echo "=== #873 ==="; gh issue view 873 --repo nodejs/corepack --comments'
````

````
=== #775 ===
author:	alexsch01
association:	none
edited:	false
status:	none
--
this can probably be closed by https://github.com/nodejs/corepack/pull/776
--
author:	aduh95
association:	contributor
edited:	false
status:	none
--
https://github.com/nodejs/corepack/pull/776 does fix pnpm integration, but it doesn't really address this issue.

I think this issue is about should Corepack be more dynamic (and therefore, more susceptible to supply chain attacks), or rely on hard-coded information (and therefore, more fragile when the upstream packages change shape). I don't have a definite opinion myself, on one hand trusting `package.json` to get the correct executable paths is unlikely to be dangerous, but also upstream very rarely change shape that maintaining `config.json` has not really been an issue.
Anyway, if someone were to send a PR to make Corepack use `package.json` more without compromising security, that would certainly be welcome.
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
Is this still reproducible with the latest `pnpm@11` release candidate? If yes, what are the exact repro steps?
--
author:	bhuynhdev
association:	none
edited:	false
status:	none
--
Heads up that: This seems to also break with pnpm v12-alpha, which has changed its bin path compared to v11, so supposedly the `config.json` file needs to be updated for pnpm v12
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
For pnpm v12-alpha, I opened a new issue https://github.com/nodejs/corepack/issues/873
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
@bhuynhdev 

> Heads up that: This seems to also break with pnpm v12-alpha, which has changed its bin path compared to v11, so supposedly the `config.json` file needs to be updated for pnpm v12

pnpm has accepted issue https://github.com/pnpm/pnpm/issues/13018 as a regression in `pnpm@12.0.0-alpha.11`. You can follow the progress if you subscribe to the issue in the pnpm repo.

Compatibility with pnpm@11 has already been resolved in the interim. So the issue here (#775) should probably be viewed as an enhancement request to dynamically interpret the `package.json` contents of pnpm.


--

=== #873 ===
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
This issue resembles https://github.com/nodejs/corepack/issues/772 for `pnpm@11.0.0-dev.1005`

Executing the following, using both the latest pre-release, and the latest production pnpm@11, does however work correctly with `corepack@0.35.0`:

```shell
corepack use pnpm@11.0.0-rc.5
corepack use pnpm@latest-11
```

--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
Cross-posted to https://github.com/pnpm/pnpm/issues/13018 in this instance, since it is not clear whether a change is needed to pnpm, or an enhancement is needed to Corepack.

I noticed on https://www.npmjs.com/package/pnpm/v/12.0.0-alpha.11?activeTab=code that the `pnpm@12.0.0-alpha.11` version defines a `preinstall` lifecycle script, which does not exist in pnpm@11.
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
- https://github.com/pnpm/pnpm/issues/13018 is closed with the comment:

> There is nothing we can do on our end. If we add a backward compatible js shim it will make pnpm startup slower.
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
https://github.com/nodejs/corepack/pull/887 is now open with a proposal to make Corepack compatible with pnpm@12
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
This issue is resolved in [pnpm 12.0.0-rc.6](https://github.com/pnpm/pnpm/releases#release-v12.0.0-rc.6) 

## Verification

On Ubuntu 24.04.4 LTS, Node.js 24.19.0 LTS, Corepack 0.35.0

```shell
rm -rf ~/.cache/node/corepack
npm uninstall pnpm -g # if previously installed globally
corepack enable pnpm
cd $(mktemp -d)
corepack use pnpm@next-12
pnpm -v
```

## Logs

```console
$ rm -rf ~/.cache/node/corepack
npm uninstall pnpm -g # if previously installed globally
corepack enable pnpm
cd $(mktemp -d)
corepack use pnpm@next-12

up to date in 151ms
Installing pnpm@12.0.0-rc.6 in the project...

Downloading the pnpm 12.0.0-rc.6 binary for linux-x64...
Already up to date
Done in 24ms using pnpm v12.0.0-rc.6
pnpm -v
12.0.0-rc.6
```

--
````

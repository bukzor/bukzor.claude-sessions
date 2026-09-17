---
captured: "2026-09-17"
method: ./2026-09-17-002-direnv-stdlib-path-add-unconditional-prepend-no-path-external-dedup.sh
---

# direnv stdlib path_add: unconditional prepend, no PATH-external dedup

```sh
'bash' '-c' 'grep -n '\''path_add'\'' -A 20 /home/bukzor/repo/github.com/bukzor/dotfiles--main-reunify/.config/direnv/stdlib.sh | sed -n '\''1,25p'\'''
```

```
555:  path_add PATH "$@"
556-}
557-
558:# Usage: path_add <varname> <path> [<path> ...]
559-#
560-# Works like PATH_add except that it's for an arbitrary <varname>.
561:path_add() {
562-  local path i var_name="$1"
563-  # split existing paths into an array
564-  declare -a path_array
565-  IFS=: read -ra path_array <<<"${!1-}"
566-  shift
567-
568-  # prepend the passed paths in the right order
569-  for ((i = $#; i > 0; i--)); do
570-    path_array=("$(expand_path "${!i}")" ${path_array[@]+"${path_array[@]}"})
571-  done
572-
573-  # join back all the paths
574-  path=$(
575-    IFS=:
576-    echo "${path_array[*]}"
577-  )
578-
579-  # and finally export back the result to the original variable
```

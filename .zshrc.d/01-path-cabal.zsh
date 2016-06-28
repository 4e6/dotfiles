## symlink cabal sandboxed packages
#
# file `cabal_packages/package_name/links` list executables that should be
# linked to `local_bin`, if not exists `package_name` will be used as fallback

zmodload zsh/mapfile

local -r cabal_packages=~/projects/cabal
local -r local_bin=~/bin

# space separated list of filenames
broken_symlinks () {
  local dir=$1
  echo $dir/*(N-@)
}

# make path for cabal executable
local_cabal_executable () {
  local -r package="$1"
  local -r name="$2"
  echo "$package/.cabal-sandbox/bin/$name"
}

# symlink `filename` to `linkname` if
# `filename` is executable and
# `linkname` not exist
local_make_symlink () {
  local -r filename=$1
  local -r linkname=$2
  [[ ! -h $linkname ]] && [[ -x $filename ]] && ln -v -s "$filename" "$linkname"
}

# remove dead links from `local_bin` path
local -a deadlinks=( $(broken_symlinks $local_bin) )
[[ ${#deadlinks[@]} -ne 0 ]] && rm -v "${deadlinks[@]}"

# symlink cabal executables to `local_bin` path
for package in $cabal_packages/*(N); do
  local -a filenames
  if [[ -f "$package/links" ]]; then
    filenames=( "${(f@)mapfile[$package/links]}" )
  else
    filenames=( "$(basename $package)" )
  fi

  for filename in $filenames; do
    local symlink=$local_bin/$filename
    local exe=$(local_cabal_executable "$package" "$filename")
    local_make_symlink "$exe" "$symlink"
  done
done

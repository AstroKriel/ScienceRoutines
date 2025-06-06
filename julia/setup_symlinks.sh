#!/bin/bash

# array of "symlink_name:repo_name" pairs
declare -a LINKS=(
  "JuliaTools:frigg"
  "PowerSpectra:loki"
  "CorrelationFunctions:thor"
  "EnergyTransfer:valkyrja"
)

for pair in "${LINKS[@]}"; do
  IFS=":" read -r symlink target <<< "$pair"

  if [ ! -L "$symlink" ]; then
    ln -s "$target" "$symlink"
    echo "Created symlink: $symlink -> $target"
  else
    echo "Symlink already exists: $symlink"
  fi
done

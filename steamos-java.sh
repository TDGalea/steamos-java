#!/bin/bash

# Written by TDGalea.
# Not affiliated with Valve in any way.

bashrc=~/.bashrc
touch "$bashrc"

printf "\n\n"

# Find the first Java executable from ~
java_exe="$(find ~ -type f -name java -print -quit)"
# Exit if that failed.
[[ "$java_exe" == "" ]] && printf "Failed to find a Java executable.\nInstall something that uses Java, such as Minecraft, then try again.\n" >&2 && exit 2

# Check it's actually correct (if it's executable)
if ! "$java_exe" -version >/dev/null 2>&1; then
    printf "Java executable found but returned non-zero exit code when trying '-version'.\n" >&2
    exit 1
fi

# Remove an existing Java alias if there is one.
if grep -q "# Added by SteamOS-Java script (TDGalea)" "$bashrc"; then
    printf "Removing existing alias.\n"
    grep -v '# Added by SteamOS-Java script (TDGalea)' "$bashrc" >"$bashrc-new"
    sed -i ':a;/^[ \n]*$/{$d;N;ba}' "$bashrc-new"
    mv "$bashrc-new" "$bashrc"
fi

# Append the alias to ~/.bashrc
printf "\nalias java='$java_exe' # Added by SteamOS-Java script (TDGalea)\n" >>"$bashrc"

# Done.
printf "Alias added. Start a new terminal and try running java.\n"
exit 0

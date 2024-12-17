#!/bin/bash

tools=`awk '{print $1}' .tool-versions | grep -v '^$'`
new_tool_versions=""

for tool in $tools; do
  latest_version=`asdf list-all $tool | grep '^[0-9].*\.[0-9]*$' | tail -n 1`
  current_version=`awk -v tool="$tool" '$1 == tool {print $2}' .tool-versions`
  if [ "$latest_version" != "$current_version" ]; then
    echo "Updating $tool from $current_version to $latest_version"
  else
    echo "$tool is already up to date at version $current_version"
  fi
  new_tool_versions+="$tool $latest_version\n"
done

# Overwrite .tool-versions with the new versions
echo -e "$new_tool_versions" > .tool-versions

echo "Installing new versions of tools..."
# Install all tools with the new versions
asdf install

#!/bin/sh

# Add Composer's global binaries to PATH
if command -v composer >/dev/null; then
  COMPOSERBIN=$(composer global config bin-dir --absolute 2>/dev/null)
  export PATH=$COMPOSERBIN:${PATH}
fi

#!/bin/sh
# Rebuild the published Twisted Takes pages inside the ist444 repository.
#
# GitHub Pages serves ist444 as plain files, so it cannot run Jekyll on this
# source folder. After editing anything in _twisted-takes/, run:
#
#   sh _twisted-takes/tools/build-ist444.sh     (from the ist444 folder)
#
# then commit and push both _twisted-takes/ and twisted-takes/.
set -e
cd "$(dirname "$0")/.."
if [ -d /opt/homebrew/opt/ruby@3.3/bin ]; then PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"; fi
JEKYLL_ENV=production bundle exec jekyll build --destination ../twisted-takes
node tools/check-site.mjs --site ../twisted-takes
echo "Built ../twisted-takes. Commit and push to publish."

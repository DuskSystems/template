#!/usr/bin/env bash
set -euxo pipefail

REPO="DuskSystems/{{ project-name }}"

# Create
gh repo create "${REPO}" \
  --public \
  --description "{{ description }}" \
  --homepage "https://dusksystems.github.io/{{ project-name }}" \
  --source .

# Configure
gh api "repos/${REPO}" -X PATCH \
  -F allow_auto_merge=true \
  -F allow_merge_commit=false \
  -F allow_squash_merge=false \
  -F allow_update_branch=true \
  -F delete_branch_on_merge=true \
  -F has_projects=false \
  -F has_wiki=false \
  -F web_commit_signoff_required=true

# Topics
TOPICS=("rust" $(cargo metadata --no-deps --format-version=1 | jq -r '.packages[0].keywords[]'))
for TOPIC in "${TOPICS[@]}"; do
  gh repo edit "${REPO}" --add-topic "${TOPIC}"
done

# Immutable Releases
gh api "repos/${REPO}/immutable-releases" -X PUT

# GitHub Pages
gh api "repos/${REPO}/pages" -X POST -f build_type=workflow

# Branch Rules
gh api "repos/${REPO}/rulesets" -X POST \
  --input - <<< '{
    "name": "main",
    "target": "branch",
    "enforcement": "active",
    "conditions": {
      "ref_name": {
        "include": ["refs/heads/main"],
        "exclude": []
      }
    },
    "rules": [
      { "type": "deletion" },
      { "type": "non_fast_forward" },
      { "type": "required_linear_history" }
    ]
  }'

# Push
git push -u origin main

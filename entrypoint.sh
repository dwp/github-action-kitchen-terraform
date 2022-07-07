#!/bin/bash -l
# Ensures that kitchen errors are maintained when piped through sed
set -o pipefail

update-ca-certificates || true

if [ -n "$GITLAB_USER" ] && [ -n "$GITLAB_PAT" ]; then
  # Set GitLab user
  git config credential.https://gitlab.com.username "${GITLAB_USER}"

  # Configure script to pass GitLab PAT from $GITLAB_PAT env var
  # This avoids PAT being on disk, shell history, and terminal output
  # See docs: https://git-scm.com/docs/gitcredentials#_requesting_credentials
  GIT_ASKPASS=$(mktemp) && chmod a+rx "$GIT_ASKPASS" && export GIT_ASKPASS
  cat > "$GIT_ASKPASS" <<'EOF'
#!/bin/bash
exec echo "$GITLAB_PAT"
EOF

fi

if [ -z "$2" ]; then
  bundle exec kitchen "${1}"
else
  bundle exec kitchen "${1}" | sed "s/$2/REDACTED/g"
fi

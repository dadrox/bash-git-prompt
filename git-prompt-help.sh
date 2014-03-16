#!/bin/bash
#  git-prompt-help -- show useful info to help new users with the information
# being displayed.

git_prompt_help() {
 cat <<EOF | sed 's/\\\[\\033//g' | sed 's/\\\]//g'
The git prompt format is [<BRANCH><TRACKING>|<LOCALSTATUS>]

BRANCH is a branch name, such as "master" or "stage", a tag name, or commit
hash prefixed with ':'.

TRACKING indicates how the local branch differs from the
remote branch.  It can be empty, or one of:

    ${GIT_PROMPT_BRANCH}${Reset}${GIT_PROMPT_REMOTE}${GIT_PROMPT_AHEAD}N${Reset}    - ahead of remote by N commits
    ${GIT_PROMPT_BRANCH}${Reset}${GIT_PROMPT_REMOTE}${GIT_PROMPT_BEHIND}N${Reset}    - behind remote by N commits
    ${GIT_PROMPT_BRANCH}${Reset}${GIT_PROMPT_REMOTE}${GIT_PROMPT_BEHIND}M${GIT_PROMPT_AHEAD}N${Reset} - branches diverged, other by M commits, yours by N commits

LOCALSTATUS is one of the following:

    ${GIT_PROMPT_CLEAN}${Reset}   - repository clean
    ${GIT_PROMPT_STAGED}N${Reset}  - N staged files
    ${GIT_PROMPT_CONFLICTS}N${Reset}  - N conflicted files
    ${GIT_PROMPT_CHANGED}N${Reset}  - N changed but *unstaged* files
    ${GIT_PROMPT_UNTRACKED}N${Reset}  - N untracked files
    ${GIT_PROMPT_STASHED}N${Reset}  - N stash entries

See "git_prompt_examples" for examples.
EOF
}

help_git_prompt() { git_prompt_help ; }

git_prompt_examples() {
  cat <<EOF | sed 's/\\\[\\033//g' | sed 's/\\\]//g'
These are examples of the git prompt:

  [${GIT_PROMPT_BRANCH}master${Reset}${GIT_PROMPT_REMOTE}${GIT_PROMPT_AHEAD}3${Reset}|${GIT_PROMPT_CHANGED}1${Reset}]  - on branch "master", ahead of remote by 3 commits, 1
                    file changed but not staged

  [${GIT_PROMPT_BRANCH}status${Reset}|${GIT_PROMPT_STAGED}2${Reset}]     - on branch "status", 2 files staged

  [${GIT_PROMPT_BRANCH}master${Reset}|${GIT_PROMPT_CHANGED}7${GIT_PROMPT_UNTRACKED}2${Reset}]    - on branch "master", 7 files changed, some files untracked

  [${GIT_PROMPT_BRANCH}master${Reset}|${GIT_PROMPT_CONFLICTS}2${GIT_PROMPT_CHANGED}3${Reset}]   - on branch "master", 2 conflicts, 3 files changed

  [${GIT_PROMPT_BRANCH}master${Reset}|${GIT_PROMPT_STASHED}2${Reset}]     - on branch "master", 2 stash entries

  [${GIT_PROMPT_BRANCH}experimental${Reset}${GIT_PROMPT_REMOTE}${GIT_PROMPT_BEHIND}2${GIT_PROMPT_AHEAD}3${Reset}|${GIT_PROMPT_CLEAN}${Reset}]
                  -  on branch "experimental"; your branch has diverged
                     by 3 commits, remote by 2 commits; the repository is
                     otherwise clean

  [${GIT_PROMPT_BRANCH}:70c2952${Reset}|${GIT_PROMPT_CLEAN}${Reset}]    - not on any branch; parent commit has hash "70c2952"; the
                    repository is otherwise clean
EOF
}


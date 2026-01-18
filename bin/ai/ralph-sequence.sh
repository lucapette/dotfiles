#!/bin/bash

set -e

opencode run \
"@.ai/wip/tasks.md @.ai/wip/progress.txt \
1. Find the next task to work on. \
2. Check any feedback loops, such as types and tests. \
3. Append your progress to the progress.txt file. \
4. Make a git commit for that step. \
5. Repeat from step 1. \
ONLY WORK ON A SINGLE STEP PER TIME. \
"


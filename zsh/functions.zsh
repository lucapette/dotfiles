# function to go to a parent directory of the current directory.
# It takes the number of directory to ascend as argument.
up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
  do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# List all my code dirs
projects() {
  ls -d ~/code/*/ ~/gocode/src/github.com/lucapette/*/
}

# Show git status with no args, delegate to git otherwise
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -s
  fi
}

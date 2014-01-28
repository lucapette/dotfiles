# function to go to a parent directory of the current directory.
# It takes the number of directory to ascend as argument.
up(){
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

function projects {
  ls -d ~/code/*/ ~/gocode/src/github.com/lucapette/*/
}

function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status -s
  fi
}

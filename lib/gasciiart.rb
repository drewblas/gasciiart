require 'gasciiart/version'
require 'gasciiart/builder'

module Gasciiart
  RUNNER = <<-EOF
#!/bin/bash

echo "\033[0;40m"

for ref in `git rev-list HEAD --reverse`
do
  git checkout $ref > /dev/null 2> /dev/null
  clear
  cat animation.txt
  sleep 0.05
done

git checkout HEAD
  EOF
end

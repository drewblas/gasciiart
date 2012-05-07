require 'gasciiart/version'
require 'gasciiart/builder'

module Gasciiart
  RUNNER = <<-EOF
#!/bin/bash

for ref in `git rev-list HEAD --reverse`
do
  git checkout $ref > /dev/null 2> /dev/null
  clear
  cat animation.txt
  sleep 0.05
done

  EOF
end

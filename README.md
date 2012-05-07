# Gasciiart

Gasciiart creates an animated git repository.  Each frame of ASCII animation is a separate commit.

Using the run.sh script, the repository will "play" itself by checking out each commit in turn and displaying it.

## Installation

Add this line to your application's Gemfile:

    gem 'gasciiart'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gasciiart

## Usage

You should have an input directory where each frame to be animated is a separate file.  e.g.:

    - input/
      - 00001.txt
      - 00002.txt
      - 00003.txt
      - 00004.txt

(The filenames are sorted by Ruby, so use any naming scheme as long as the sort results in the order you want)

Run the command:

    gasciiart --source input/ --target output/

(The output directory must **not** exist beforehand)

The output directory will have the run.sh script to start the animation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2012 Drew Blas. See LICENSE.txt for further details.


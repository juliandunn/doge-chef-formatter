Doge Chef Formatter
===================

So resource. Much converge. Wow.

[![much resources. wow](https://pbs.twimg.com/media/BnZ4M_cCQAI2r_x.jpg)]

Usage
=====

Install the gem:

    gem install doge-chef-formatter

If you are using Omnibus Chef you need to specify the full path to the `gem`
binary:

    /opt/chef/embedded/bin/gem install doge-chef-formatter

Or write a cookbook to install it using the `chef_gem` resource, if that's
how you roll.

Then add the following to your `/etc/chef/client.rb` file:

    gem 'doge-chef-formatter'
    require 'doge-chef-formatter'

This enables the formatter, but doesn't use it by default. To see Shibu in
all his glory, run:

    chef-client -Fdoge -lfatal

Acknowledgements
================

* Andrea Campi (@andreacampi) for the [nyan-cat-chef-formatter](https://github.com/andreacampi/nyan-cat-chef-formatter) that was the original inspiration
* Michael Ducy for daring me to write this
* Jon Cowie (@jonlives) for his presentation on the event dispatch system

License and Authors
===================

Author:: Julian C. Dunn (<jdunn@getchef.com>)
License:: Apache 2.0

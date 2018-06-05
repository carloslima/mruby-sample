# Hello!

(brief) Introduction to mruby

Carlos Lima
https://github.com/carloslima

Rapid River Software
https://rrsoft.co

This code is available at:
https://github.com/carloslima/mruby-sample

@ Ruby Tuesdays #52
https://www.meetup.com/ruby-malaysia

# Introduction to mruby

* Uses mruby?
* Tried mruby?
* Know what it is?
* Heard of it?

# What's mruby

* embedded ruby (IIRC)
* lightweight (trimmed down) version of ruby
* compatible with Ruby 1.9 syntax
* no `require` keyword

# Why mruby?

* Ruby install is big. Many files, libraries, dependencies.
```
carlos@rr-carlos ~> du -hs ~/.rbenv/versions/2.4.1/; find ~/.rbenv/versions/2.4.1/ | wc -l
424M	/home/carlos/.rbenv/versions/2.4.1/
42083
```

* mruby is a small single binary
* cut down features favoring small binary size, smaller memory footprint, reduced cpu usage
* single binary includes all libraries compiled in
* only includes what is needed

# Use cases

* embedded devices
* embedded into other applications (run ruby from C)
* limited resources
* easier deployment of ruby (single binary)
* standalone binary ruby application

# Ways of using

* ship the 'mruby' interpreter to execute ruby scripts
    `mruby archnews.rb`
* precompile ruby sources to bytecode.
  Smaller deployment artifact, faster execution (no parsing step)
  Similar to Python's .pyc (I guess)
    `mrbc archnews.rb` # generates archnews.mrb
    `mruby -b archnews.mrb`
* compile to a .c source that is further compiled into a standalone binary
  This repo has an example of this case.
* embed a ruby engine into your C application
  Allows you to run ruby code from regular C strings or .rb files

# My interest

* Sysadmin / Operations involves a lot of "glue" scripting
* Bash is a mine field and a liability but available everywhere
* Perl is good and available everywhere but less appealing to team members
* Python has the same issue as Perl
* Ruby not always available. Not sure which version is installed. Not sure which gems can be used.
* Glue scripting is usually simple (single file). Show up with a Gemfile and a source tree and a sysadmin will replace it with Bash in a heartbeat
* I envy Go's single binary, no dependency approach

# Bummer

* mruby docs are not great
* the compile app into single binary approach is not obvious/trivial. Always takes me time figuring how to do it again
* I turned the steps into a repository with a Makefile to turn a single .rb into a standalone binary in one step

# Selective compilation

* mruby is smaller by trimming down what gets compiled. How does that work?
  `build_config.rb`
* if `require` is not available and many features are not included, how is it useful?
  `mgems`, configured from `build_config.rb`
  See list: https://github.com/mruby/mgem-list

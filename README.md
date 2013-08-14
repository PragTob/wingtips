Shoes Presentation[![Code Climate](https://codeclimate.com/github/PragTob/shoes_presentation.png)](https://codeclimate.com/github/PragTob/shoes_presentation)
==================

A presentation about shoes - written in shoes (WIP)

## Getting it running

- Clone this repository
- Make sure you got jruby-1.7.0 or higher installed (I use jruby-1.7.4)
- Install & running
  - **Linux & Windows**
    -run `bundle install` (this installs a current shoes4 pre-alpha release straight from github)
    - run `ruby-shoes shoes_presentation.rb` (kind of optimized for 1024 * 768 since that's the beamer resolution at JRubyConf)
  - **Mac OSX** (I don't have a Mac so still gotta validate this)
    - go over to [shoes4](https://github.com/shoes/shoes4) and follow the install instructions there
    - then run `shoes4_path/bin/shoes shoes_presentation.rb`
    - Why do I have to do that? Well for OSX you need different start options before starting JRuby which is an SWT thing with Mac OSX. We're working on a solution for a release :-)
- use left/right arrow or paga up/down to advance. F11 to toggle fullscreen

## State of this

This is an alpha presentation software written with a pre-alpha GUI toolkit - so some things are a bit rough. Like the resolution as it does not fully adapt to every resolution - it should work, it might just look weird.

If it does not work, please report an issue :-) I'll also upload a pdf slide set with screen shots (I haven't implemented PDF export yet ;-) )

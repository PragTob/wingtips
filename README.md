# Wingtips

A presentation tool written in ruby - write your slides in Ruby!

## Attention

This coming to a gem host near you soon enough, for now shoes4.pre2 is missing the files we need for code highlighting - we will try to figure this out soon enough :)

## Installation

Ensure that [JRuby](jruby.org) is installed.

Add this line to your application's Gemfile:

```ruby
gem 'wingtips'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wingtips

## Usage

A `wingtips` presentation expects this layout:

```
presentation_folder/
  config.rb
  slides/*.rb
  code/*.rb
  images/*.*
```

And a basic slide looks like this:

```ruby
class Bullets < Wingtips::Slide
  def content
    headline 'Use bullet points, would you?'

    bullet "It's easy isn't it?"
    bullet 'Just keep on'
    bullet 'with ease!'
  end
end
```

### OS X
If the gem is not installing (`gem install wingtips`),
1. Fork this repo.
2. Add this flag to `bin/wingtips`:
```ruby
#! /usr/bin/env jruby -J-XstartOnFirstThread
```
this prevents this error on Mac OS X:
```bash
Presenting 12 slides
***WARNING: Display must be created on main thread due to Cocoa restrictions.
LoadError: Couldn't load backend Shoes::Swt'. Error: load error: shoes/swt -- org.eclipse.swt.SWTException: Invalid thread access
org/jruby/RubyKernel.java:1065:in `require'
```
3. start the presentation with `bin/wingtips samples/wingtips_introduction`
4. left/right arrows navigate the slides


## Contributing

1. Fork it ( https://github.com/[my-github-username]/wingtips/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

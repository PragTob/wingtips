# Wingtips

A presentation tool written in ruby - write your slides in Ruby!

## Installation

Ensure that [JRuby](jruby.org) is installed.

Add this line to your application's Gemfile:

```ruby
gem 'wingtips'
```

Or to grab it straight from github

```ruby
gem 'wingtips', github: 'PragTob/wingtips'
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

You need need a special flag to start the presentation as it is needed by the JVM. You need to add `JRUBY_OPTS=-J-XstartOnFirstThread` when trying to launch a presentation. So to launch the sample you need to type:

```
JRUBY_OPTS=-J-XstartOnFirstThread bin/wingtips samples/wingtips_introduction
```

Otherwise without the JRUBYY_OPTS, you will encounter the following error on Mac OSX:


```bash
Presenting 12 slides
***WARNING: Display must be created on main thread due to Cocoa restrictions.
LoadError: Couldn't load backend Shoes::Swt'. Error: load error: shoes/swt -- org.eclipse.swt.SWTException: Invalid thread access
org/jruby/RubyKernel.java:1065:in `require'
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/wingtips/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Wingtips

A presentation tool written in ruby - write your slides in Ruby!

## Attention

This coming to a gem host near you soon enough, for now shoes4.pre2 is missing the files we need for code highlighting - we will try to figure this out soon enough :)

## Installation

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

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wingtips/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

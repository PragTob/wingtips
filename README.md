Shoes Presentation
==================

A presentation about shoes - written in shoes (WIP)

## Getting it running

Please open an issue if this instructions don't work out for you

- Clone this repository
- Make sure you got jruby-1.7.0 or higher installed (I use jruby-1.7.4) along with the `bundler` gem
- run `bundle install` (this installs a current shoes4 pre-alpha release straight from github)
- Running the presentation  (kind of optimized for 1024 * 768 since that's the beamer resolution at JRubyConf)
  - **Linux & Windows** run `ruby-shoes shoes_presentation.rb`
  - **Mac OSX** (I don't have a Mac so still gotta validate this) run `bundle exec jruby -J-XstartOnFirstThread shoes_presentation.rb` - the parameter is needed for the JVM on OSX to get SWT running. We'll take care of this in a release.
- use left/right arrow or pagE up/down to advance. F11 to toggle fullscreen.

## State of this

This is an alpha presentation software written with a pre-alpha GUI toolkit - so some things are a bit rough. Like the resolution as it does not fully adapt to every resolution - it should work, it might just look weird.

If it does not work, please report an issue :-) I'll also upload a pdf slide set with screen shots (I haven't implemented PDF export yet ;-) )

## Images

I do not own some of the images I used, for those please see the PhotoCredit slide (last slide in the presentation).

The images I used are either Creative Commons licensed in some way (mentioned in the PhotoCredit slide) or are some ad pictures that I hope people won't mind ;-)

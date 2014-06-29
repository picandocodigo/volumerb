# Volumerb 🔊

Gem to manage the volume on GNU/Linux and Mac OS X operating systems.

## Installation

Add this line to your application's Gemfile:

    gem 'volumerb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install volumerb

## Usage

The available methods are:
 * `vol`   - Returns the current volume state (on/off if unmuted/muted
   and a value)
 * `up`    - Increases volume.
 * `down`  - Decreases volume.
 * `mute`  - Mutes/unmutes sound.
 * `value` - Sets/gets the volume value

Example:

```ruby
$ irb
2.1.2 :001 > require 'volumerb'
 => true
2.1.2 :002 > Volumerb.vol
 => {:value=>45, :state=>"on"}
2.1.2 :003 > Volumerb.up
 => {:value=>48, :state=>"on"}
2.1.2 :004 > Volumerb.up
 => {:value=>51, :state=>"on"}
2.1.2 :005 > Volumerb.down
 => {:value=>48, :state=>"on"}
2.1.2 :006 > Volumerb.down
 => {:value=>45, :state=>"on"}
2.1.2 :007 > Volumerb.mute
 => {:value=>45, :state=>"off"}
2.1.2 :008 > Volumerb.mute
 => {:value=>45, :state=>"on"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
* Customize volume increase/decrease

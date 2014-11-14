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
 * `up`    - Increases volume. By default it increases volume by 3%, but
   you can pass a parameter between 0 and 100 like this: `Volumerb.up(50)`.
 * `down`  - Decreases volume. By default it decreases volume by 3%, but
   you can pass a parameter between 0 and 100 like this: `Volumerb.down(50)`.
 * `mute`  - Mutes/unmutes.
 * `value` - Sets/gets the volume value.
 * `state` - Returns the volume state (muted/unmuted)

Example:

```ruby
$ irb
2.1.2 :001 > require 'volumerb'
 => true
2.1.2 :002 > Volumerb.vol
 => {:value=>53, :state=>"on"}
2.1.2 :003 > 10.times { Volumerb.down }
 => 10
2.1.2 :004 > Volumerb.value
 => 23
2.1.2 :005 > Volumerb.up 37
 => {:value=>60, :state=>"on"}
2.1.2 :006 > Volumerb.mute
 => {:value=>60, :state=>"off"}
2.1.2 :007 > Volumerb.state
 => "off"
2.1.2 :008 > Volumerb.value = 100
 => 100
2.1.2 :009 > Volumerb.vol
 => {:value=>100, :state=>"off"}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Volumerb

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
 * `vol`  - Returns the current volume state (on/off if unmuted/muted
   and a value)
 * `up`   - Increases volume.
 * `down` - Decreases volume.
 * `mute` - Mutes/unmutes sound., `vol` and `mute`.
 
Example:

```ruby
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
* Method for setting the volume value directly, eg: Volumerb.vol = 30
* Customize volume increase/decrease

# -*- coding: utf-8 -*-
module Volumerb
  module MacVolume
    def self.up(value = 3)
      osa 'set currentVolume to output volume of (get volume settings)
           set volume output volume (currentVolume + #{value})'
      vol
    end

    def self.down(value = 3)
      osa 'set currentVolume to output volume of (get volume settings)
           set volume output volume (currentVolume - #{value})'
      vol
    end

    def self.mute
      state = osa 'output muted of (get volume settings)'
      setmute = !eval(state)
      osa "set volume output muted #{setmute}"
      vol
    end

    def self.value=(value)
      osa 'set volume output volume (#{value})'
      vol
    end

    def self.vol
      # Mac OS X output:
      # output volume:100, input volume:missing value, alert
      # volume:98, output muted:false
      vol = osa 'get volume settings'
      number = vol.match(/output\ volume\:([0-9]+)/)[1]
      state = vol.match(/muted:([t|f])/)[1]
      { number: number.to_s, state: state.to_s }
    end

    private

    def self.osa(script)
      `osascript -e '#{script}'`
    end
  end
end

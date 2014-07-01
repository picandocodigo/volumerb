# -*- coding: utf-8 -*-
module Volumerb
  module LinuxVolume
    def self.up(value = 3)
      `amixer -q sset Master #{value}%+`
      vol
    end

    def self.down(value = 3)
      `amixer -q sset Master #{value}%-`
      vol
    end

    def self.mute
      `amixer sset Master toggle`
      vol
    end

    def self.value=(value)
      `amixer set Master #{value}%`
      vol
    end

    def self.vol
      vol = `amixer get Master | grep "\[[0-9]*%\]\ \[o[n|f]"`
      number = vol.match(/([0-9]+)%/)[1]
      state = vol.match(/\[([a-z]+)\]/)[1]
      { value: number.to_i, state: state.to_s }
    end
  end
end

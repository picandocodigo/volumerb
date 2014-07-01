# -*- coding: utf-8 -*-
require 'volumerb/version'

module Volumerb
  def self.up(value = 3)
    mixer.up(value)
  end

  def self.down(value = 3)
    mixer.down(value)
  end

  def self.mute
    mixer.mute
  end

  def self.vol
    mixer.vol
  end

  def self.state
    mixer.vol[:state]
  end

  def self.value
    mixer.vol[:value]
  end

  def self.value=(value)
    mixer.value = value
  end

  private

  def self.mixer
    @mixer ||= begin
      if RUBY_PLATFORM =~ /linux/
        require 'volumerb/linux_volume'
        Volumerb::LinuxVolume
      elsif RUBY_PLATFORM =~ /darwin|macos/
        require 'volumerb/mac_volume'
        Volumerb::MacVolume
      else
        raise "Unsupported Ruby platform"
      end
    end
  end
end

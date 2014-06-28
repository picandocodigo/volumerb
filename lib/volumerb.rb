# -*- coding: utf-8 -*-
require 'volumerb/version'

module Volumerb
  def self.up
    mixer unless @mixer
    @mixer.up
  end

  def self.down
    mixer unless @mixer
    @mixer.down
  end

  def self.mute
    mixer unless @mixer
    @mixer.mute
  end

  def self.vol
    mixer unless @mixer
    @mixer.vol
  end

  private

  def self.mixer
    if RUBY_PLATFORM =~ /linux/
      require 'volumerb/linux_volume'
      @mixer = Volumerb::LinuxVolume
    elsif RUBY_PLATFORM =~ /darwin|macos/
      require 'volumerb/mac_volume'
      @mixer = Volumerb::MacVolume
    else
      raise "Unsupported Ruby platform"
    end
  end
end

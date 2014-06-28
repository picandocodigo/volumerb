require 'minitest/autorun'
require 'volumerb'

class VolumerbTest < Minitest::Test
  def test_vol
    volume = Volumerb.vol
    assert_instance_of Hash, volume
    assert_includes 0..100, volume[:value]
    assert_match(/on|off/, volume[:state])
  end

  def test_up
    previous = Volumerb.vol[:value]
    assert_operator(previous, :<, Volumerb.up[:value])
    # Restore volume
    Volumerb.down
  end

  def test_down
    previous = Volumerb.vol[:value]
    assert_operator(previous, :>, Volumerb.down[:value])
    # Restore volume
    Volumerb.up
  end

  def test_mute
    states = {'off' => 'on', 'on' => 'off'}
    assert_equal Volumerb.vol[:state], states[Volumerb.mute[:state]]
    # Restore volume
    Volumerb.mute
  end
end

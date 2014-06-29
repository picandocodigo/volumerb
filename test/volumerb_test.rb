require 'minitest/autorun'
require 'volumerb'

class VolumerbTest < Minitest::Test
  def test_vol
    volume = Volumerb.vol
    assert_instance_of Hash, volume
    assert_includes 0..100, volume[:value]
    assert_match(/on|off/, volume[:state])
  end

  def test_state
    assert_match(/on|off/, Volumerb.state)
  end

  def test_value
    assert_includes 0..100, Volumerb.value
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

  def test_value
    volume = Volumerb.value
    assert_includes 0..100, volume
    Volumerb.value = 50
    assert_equal Volumerb.value, 50
    Volumerb.value = 80
    assert_equal Volumerb.value, 80
    Volumerb.value = volume
  end
end

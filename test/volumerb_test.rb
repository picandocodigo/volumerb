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

  def test_setting_value
    previous = Volumerb.value
    Volumerb.value = 50
    assert_equal Volumerb.value, 50
    Volumerb.value = 80
    assert_equal Volumerb.value, 80
    restore_volume(previous)
  end

  def test_up
    previous = Volumerb.vol[:value]
    if previous == 100
      assert_equal(previous, Volumerb.up[:value])
      Volumerb.value = 10
      assert_operator(Volumerb.value, :<, Volumerb.up[:value])
    else
      assert_operator(previous, :<, Volumerb.up[:value])
    end
    # Restore volume
    restore_volume(previous)
  end

  def test_down
    previous = Volumerb.vol[:value]
    if previous == 0
      assert_equal(previous, Volumer.down[:value])
      Volumerb.value = 40
      assert_operator(Volumerb.value, :>, Volumerb.down[:value])
    end
    assert_operator(previous, :>, Volumerb.down[:value])
    # Restore volume
    restore_volume(previous)
  end

  def test_mute
    states = {'off' => 'on', 'on' => 'off'}
    assert_equal Volumerb.vol[:state], states[Volumerb.mute[:state]]
    # Restore state
    Volumerb.mute
  end

  private

  def restore_volume(previous)
    Volumerb.value = previous
  end
end

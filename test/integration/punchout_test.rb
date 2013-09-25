require File.expand_path('../test_helper', __FILE__)

require 'punchout'
require 'punchout/matcher/class'

class Punchout::Test < ActiveSupport::TestCase
  setup do
    @punchout_klass = Class.new do
      include Punchout::Punchable
    end

    @pairings = 3.times.map {
      {match: Class.new, punchable: Class.new}
    }
  end

  test "#punch" do
    punchout = @punchout_klass.new
    puncher = punchout.puncher

    @pairings.each do |p|
      matcher = Punchout::Matcher::Klass.new(p[:match])

      matchable = matcher.punches(p[:punchable])

      puncher.add(matchable)
    end

    expected = @pairings.first

    expected_matching_instance = expected[:match].new

    result = puncher.can_punch?(expected_matching_instance)
    assert result, "#{punchout.puncher.inspect} CAN NOT PUNCH #{expected[:match]}"

    result = puncher.punch(expected_matching_instance)
    assert_equal expected[:punchable],result
  end
end

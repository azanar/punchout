require File.expand_path('../../test_helper', __FILE__)

require 'punchout/fabricable'
require 'punchout/matcher/class'

class Punchout::Fabricator::Test < Test::Unit::TestCase
  class Factory
    def initialize(pairings)
      @pairings = pairings
    end

    def build(thing)
      matcher = Punchout::Matcher::Klass.new(thing)
      punchable = @pairings.find {|p| p[:match] == thing.class}[:punchable]
      matcher.punches(punchable)
    end
  end

  setup do
    punchout_klass = Class.new do
      include Punchout::Fabricable

      attr_accessor :factory
    end

    @pairings = 3.times.map {
      {match: Class.new, punchable: Class.new}
    }

    fabricator = punchout_klass.new
    fabricator.factory = Factory.new(@pairings)

    @puncher = fabricator.puncher
  end

    
  test "#punch exists" do
    @pairings.each do |p|
      matcher = Punchout::Matcher::Klass.new(p[:match])

      matchable = matcher.punches(p[:punchable])

      @puncher.add(matchable)
    end

    expected = @pairings.first

    expected_matching_instance = expected[:match].new

    result = @puncher.can_punch?(expected_matching_instance)
    assert result, "#{@puncher.inspect} CAN NOT PUNCH #{expected[:match]}"

    result = @puncher.punch(expected_matching_instance)
    assert_equal expected[:punchable],result
  end

  test "#punch does not exists" do
    expected = @pairings.first

    expected_matching_instance = expected[:match].new

    result = @puncher.can_punch?(expected_matching_instance)
    assert result, "#{@puncher.inspect} CAN NOT PUNCH #{expected[:match]}"

    result = @puncher.punch(expected_matching_instance)
    assert_equal expected[:punchable],result
  end
end


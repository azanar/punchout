
require File.expand_path('../../../test_helper', __FILE__)

require 'punchout/matcher/class'

class Punchout::Matcher::KlassTest < Test::Unit::TestCase
  setup do
    @ancestor_klass = Class.new

    @base_klass = Class.new(@ancestor_klass)

    @derived_klass = Class.new(@base_klass)

    @independent_klass = Class.new

    @mock_thing = mock
  end

  test "#match none" do
    matcher = Punchout::Matcher::Klass.new(@derived_klass)
    result = matcher.matches?(@independent_klass.new)

    assert_equal false, result
  end

  test "#match should match equivalence" do
    matcher = Punchout::Matcher::Klass.new(@base_klass)
    result = matcher.matches?(@base_klass.new)

    assert_equal true, result
  end

  test "#match should match descendant" do
    matcher = Punchout::Matcher::Klass.new(@base_klass)
    result = matcher.matches?(@derived_klass.new)

    assert_equal false, result
  end

  test "#match should not match ancestor" do
    matcher = Punchout::Matcher::Klass.new(@derived_klass)
    result = matcher.matches?(@base_klass.new)

    assert_equal false, result
  end
end



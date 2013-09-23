
require File.expand_path('../../../test_helper', __FILE__)

require 'punchout/matcher/class'

class Punchout::Matcher::KlassTest < ActiveSupport::TestCase
  setup do
    @ancestor_klass = Class.new

    @base_klass = Class.new(@ancestor_klass)

    @derived_klass = Class.new(@base_klass)

    @independent_klass = Class.new
  end

  test "#match none" do

    matcher = Punchout::Matcher::Klass.new([@base_klass, @derived_klass])
    result = matcher.match(@independent_klass.new)

    assert_equal nil, result
  end

  test "#match concrete level" do
    matcher = Punchout::Matcher::Klass.new([@base_klass, @derived_klass])
    result = matcher.match(@derived_klass.new)

    assert_equal @derived_klass, result
  end

  test "#match ancestry level" do
    matcher = Punchout::Matcher::Klass.new([@base_klass])
    result = matcher.match(@derived_klass.new)

    assert_equal nil, result
  end

  test "#match ancestry level derived match" do
    matcher = Punchout::Matcher::Klass.new([@derived_klass])
    result = matcher.match(@base_klass.new)

    assert_equal nil, result
  end

  test "#match concrete level ancestry match" do
    matcher = Punchout::Matcher::Klass.new([@base_klass])
    result = matcher.match(@derived_klass.new)

    assert_equal nil, result
  end
end



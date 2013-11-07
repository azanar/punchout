
require File.expand_path('../../../test_helper', __FILE__)

require 'punchout/matcher/equal'

class Punchout::Matcher::EqualTest < ActiveSupport::TestCase
  test "#match none" do
    matcher = Punchout::Matcher::Equal.new("foo")
    assert_equal false, matcher.matches?("bar")
  end

  test "#match should match equivalence" do
    matcher = Punchout::Matcher::Equal.new("foo")
    assert_equal true, matcher.matches?("foo")
  end

end

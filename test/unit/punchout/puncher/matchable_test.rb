require File.expand_path('../../../test_helper', __FILE__)

require 'punchout/puncher/matchable'

class Punchout::Puncher::MatchableTest < ActiveSupport::TestCase
  test "#matches? true" do
    mock_matcher = mock
    mock_thing = mock

    mock_matcher.expects(:matches?).with(mock_thing).returns(true)
    matchable = Punchout::Puncher::Matchable.new(mock_matcher, mock_thing)

    result = matchable.matches?(mock_thing)

    assert_equal true, result
  end

  test "#matches? false" do
    mock_matcher = mock
    mock_thing = mock

    mock_matcher.expects(:matches?).with(mock_thing).returns(false)
    matchable = Punchout::Puncher::Matchable.new(mock_matcher, mock_thing)

    result = matchable.matches?(mock_thing)

    assert_equal false, result
  end
end

require File.expand_path('../../test_helper', __FILE__)

require 'punchout/matcher'

class Punchout::MatcherTest < Test::Unit::TestCase
  setup do
    @mock_subject = mock
    @matcher = Punchout::Matcher.new(@mock_subject)
  end

  test "#punches" do
    mock_thing = mock

    mock_matchable = mock

    Punchout::Puncher::Matchable.expects(:new).returns(mock_matchable)

    result = @matcher.punches(mock_thing)

    assert_equal result, mock_matchable
  end
end

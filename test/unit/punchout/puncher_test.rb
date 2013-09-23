require File.expand_path('../../test_helper', __FILE__)

require 'punchout/puncher'

class Punchout::PuncherTest < ActiveSupport::TestCase
  setup do

    mock_matcher_klass = mock

    @mock_matcher = mock
    mock_matcher_klass.expects(:new).returns(@mock_matcher)

    @puncher = Punchout::Puncher.new(mock_matcher_klass)

    @mock_type = mock
  end

  test '#fetch no match' do
    @mock_matcher.expects(:match).with(@mock_type).returns(nil)

    @puncher.fetch(@mock_type)
  end

  test '#fetch match located' do
    mock_match = mock

    mock_response = mock

    @puncher.add(mock_match, mock_response)

    @mock_matcher.expects(:match).with(@mock_type).returns(mock_match)

    @puncher.fetch(@mock_type)
  end
end

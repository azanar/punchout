require File.expand_path('../../test_helper', __FILE__)

require 'punchout/puncher'

class Punchout::PuncherTest < Test::Unit::TestCase
  setup do

    @mock_matchables = mock

    @puncher = Punchout::Puncher.new

    @mock_type = mock
  end

  test '#punch no match' do
    @mock_matchables.expects(:find).with(@mock_type).returns(nil)

    @puncher.instance_variable_set(:@matchables, @mock_matchables)

    result = @puncher.punch(@mock_type)

    assert_equal nil, result
  end

  test '#punch match located' do
    mock_matchable = mock

    @mock_matchables.expects(:find).with(@mock_type).returns(mock_matchable)

    mock_thing = mock
    mock_matchable.expects(:thing).returns(mock_thing)

    @puncher.instance_variable_set(:@matchables, @mock_matchables)

    result = @puncher.punch(@mock_type)

    assert_equal mock_thing, result
  end
end

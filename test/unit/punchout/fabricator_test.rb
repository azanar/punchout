require File.expand_path('../../test_helper', __FILE__)

require 'punchout/fabricator'
require 'punchout/puncher'

class Punchout::FabricatorTest < ActiveSupport::TestCase
  setup do
    @mock_factory = mock
    @mock_puncher = mock

    Punchout::Puncher.expects(:new).returns(@mock_puncher)

    @fabricator = Punchout::Fabricator.new(@mock_factory)

    @mock_type = mock
  end

  test '#punch no match' do
    @mock_puncher.expects(:can_punch?).with(@mock_type).returns(false)

    mock_matchable = mock
    @mock_factory.expects(:build).with(@mock_type).returns(mock_matchable)

    @mock_puncher.expects(:add).with(mock_matchable)

    mock_thing = mock
    mock_matchable.expects(:thing).returns(mock_thing)

    result = @fabricator.punch(@mock_type)

    assert_equal mock_thing, result
  end

  test '#punch match located' do
    mock_thing = mock

    @mock_puncher.expects(:can_punch?).with(@mock_type).returns(true)

    @mock_puncher.expects(:punch).with(@mock_type).returns(mock_thing)

    @fabricator.instance_variable_set(:@matchables, @mock_matchables)

    result = @fabricator.punch(@mock_type)

    assert_equal mock_thing, result
  end

end

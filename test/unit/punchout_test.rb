require File.expand_path('../test_helper', __FILE__)

require 'punchout'

class Punchout::PunchableTest < Test::Unit::TestCase
  test "#include" do
    @klass = Class.new do
      include Punchout::Punchable
    end
  end

  test "#puncher greenfield" do
    @klass = Class.new do
      include Punchout::Punchable
    end

    instance = @klass.new

    mock_matcher_klass = mock

    mock_puncher = mock
    Punchout::Puncher.expects(:new).returns(mock_puncher)

    instance.matcher = mock_matcher_klass
    
    result = instance.puncher

    assert_equal mock_puncher, result
  end

  test "#puncher cached" do
    @klass = Class.new do
      include Punchout::Punchable
    end

    instance = @klass.new

    mock_matcher_klass = mock

    mock_puncher = mock

    instance.matcher = mock_matcher_klass
    instance.instance_variable_set(:@puncher, mock_puncher)
    
    result = instance.puncher

    assert_equal mock_puncher, result
  end

  test "#punch" do
    @klass = Class.new do
      include Punchout::Punchable
    end

    instance = @klass.new

    mock_matcher_klass = mock

    mock_puncher = mock

    instance.matcher = mock_matcher_klass
    instance.instance_variable_set(:@puncher, mock_puncher)

    mock_obj = mock

    mock_punched = mock
    mock_puncher.expects(:punch).with(mock_obj).returns(mock_punched)
    
    result = instance.punch(mock_obj)

    assert_equal mock_punched, result
  end
end


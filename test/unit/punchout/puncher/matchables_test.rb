require File.expand_path('../../../test_helper', __FILE__)

require 'punchout/puncher/matchables'

class Punchout::Puncher::MatchablesTest < ActiveSupport::TestCase
  setup do

    @mock_matchables = 5.times.map {|x|
      mock_matchable = mock
      mock_matchable.expects(:conflicts?).at_least_once.returns(false)
      mock_matchable
    }

    @matchables = Punchout::Puncher::Matchables.new

    @mock_matchables.each {|p|
      @matchables.add(p)
    }

    @mock_type = mock
  end

  test '#include? no match' do
    @mock_matchables.each {|p|
      p.expects(:matches?).with(@mock_type).returns(false)
    }

    result = @matchables.include?(@mock_type)

    assert_equal false, result
  end

  test '#include? match located' do
    @mock_matchables.take(4).each {|p|
      p.expects(:matches?).with(@mock_type).returns(false)
    }


    @mock_matchables.last.expects(:matches?).with(@mock_type).returns(true)

    result = @matchables.include?(@mock_type)

    assert_equal true, result
  end

  test '#fetch no match' do
    @mock_matchables.each {|p|
      p.expects(:matches?).with(@mock_type).returns(false)
    }

    result = @matchables.find(@mock_type)

    assert_equal nil, result
  end

  test '#fetch match located' do
    @mock_matchables.take(4).each {|p|
      p.expects(:matches?).with(@mock_type).returns(false)
    }


    @mock_matchables.last.expects(:matches?).with(@mock_type).returns(true)

    result = @matchables.find(@mock_type)

    assert_equal @mock_matchables.last, result
  end
end

require 'punchout/puncher'

module Punchout
  module Punchable
    def punchable?
      true
    end

    attr_accessor :matcher

    def puncher
      if @matcher.nil?
        raise "You need to set a matcher on your Punchable first!"
      end
      @puncher ||= Puncher.new(@matcher)
    end

    def punch(obj)
      puncher.punch(obj)
    end
  end
end

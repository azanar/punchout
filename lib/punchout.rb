require 'punchout/puncher'
require 'punchout/matcher/class'

module Punchout
  module Punchable
    def punchable?
      true
    end

    attr_accessor :matcher

    def puncher
      @puncher ||= Puncher.new
    end

    def punch(obj)
      puncher.punch(obj)
    end
  end
end

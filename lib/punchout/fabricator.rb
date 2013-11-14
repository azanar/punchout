require 'punchout/puncher'

module Punchout
  class Fabricator
    def initialize(factory)
      @puncher = Puncher.new
      @factory = factory
    end

    def add(matchable)
      @puncher.add(matchable)
    end

    def can_punch?(type)
      true
    end

    def punch(type)

      if @puncher.can_punch?(type)
        @puncher.punch(type)
      else
        matchable = @factory.build(type)
        @puncher.add(matchable)
        matchable.thing
      end
    end
  end
end

require 'punchout/puncher/matchable'
require 'punchout/puncher/matchables'

module Punchout
  class Puncher
    def initialize
      @matchables = Matchables.new
    end

    def add(matchable)
      if !matchable.kind_of?(Matchable)
        raise
      end

      @matchables.add(matchable)
    end

    def can_punch?(type)
      @matchables.include?(type)
    end

    def all
      @matchables.all.map do |m|
        m.thing
      end
    end

    def punch(type)

      match = @matchables.find(type)

      if match
        match.thing
      end
    end
  end
end


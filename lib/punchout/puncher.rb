module Punchout
  class Puncher
    def initialize(matcher)
      @punchables = Set.new
      @punches = {}
      @matcher = matcher
    end

    def add(type, comparator)
      @punchables << type
      @punches[type] = comparator
    end

    def fetch(type)
      match = @matcher.new(@punchables).match(type)

      @punches[match]
    end
  end
end


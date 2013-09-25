module Punchout
  class Puncher
    class Matchable
      def initialize(matcher, thing)
        @matcher = matcher
        @thing = thing
      end

      attr_reader :thing

      def matches?(subject)
        @matcher.matches?(subject)
      end

      def conflicts?(other)
        false
      end
    end
  end
end

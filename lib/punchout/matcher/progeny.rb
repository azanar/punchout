require 'punchout/matcher'

module Punchout
  class Matcher
    class Progeny < Matcher
      def conflicts?(matcher)

      end

      def matches?(candidate)
        (@subject <= candidate.class) == true
      end
    end
  end
end

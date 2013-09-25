require 'punchout/matcher'

module Punchout
  class Matcher
    class Klass < Matcher
      def conflicts?(matcher)
        false
      end

      def matches?(candidate)
        @subject == candidate.class
      end
    end
  end
end


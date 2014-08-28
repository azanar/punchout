require 'punchout/matcher'

module Punchout
  class Matcher
    class Klass < Matcher

      def matches?(candidate)
        @subject == candidate.class
      end
    end
  end
end


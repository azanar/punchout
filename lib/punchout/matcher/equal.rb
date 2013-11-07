require 'punchout/matcher'

module Punchout
  class Matcher
    class Equal < Matcher
      def conflicts?(matcher)

      end

      def matches?(candidate)
        @subject == candidate
      end
    end
  end
end


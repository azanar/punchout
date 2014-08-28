require 'punchout/matcher'

module Punchout
  module Matcher
    class Klass

      include Punchout::Matcher

      def matches?(candidate)
        @subject == candidate.class
      end
    end
  end
end


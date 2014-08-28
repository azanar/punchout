require 'punchout/matcher'

module Punchout
  module Matcher
    class Progeny

      include Punchout::Matcher

      def matches?(candidate)
        (@subject <= candidate.class) == true
      end
    end
  end
end

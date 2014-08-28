require 'punchout/matcher'

module Punchout
  module Matcher
    # Matches when the candidate's class matches the class of the subject of
    # this matcher
    class Klass

      include Punchout::Matcher

      def matches?(candidate)
        @subject == candidate.class
      end
    end
  end
end


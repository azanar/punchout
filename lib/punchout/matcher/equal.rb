require 'punchout/matcher'

module Punchout
  module Matcher
    # Matches when the candidate matches the subject of this matcher, or any
    # ancestor of that subject.
    class Equal

      include Punchout::Matcher

      def matches?(candidate)
        @subject == candidate
      end
    end
  end
end


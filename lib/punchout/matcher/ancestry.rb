require 'punchout/matcher'

module Punchout
  module Matcher
    # Matches when the candidate's class matches the subject class of this matcher, or any
    # ancestor of that subject.
    #
    # `Matcher::Ancestry.new([]).matches?(Enumerable) => true`
    class Ancestry

      include Punchout::Matcher

      def matches?(candidate)
        (@subject >= candidate.class) == true
      end
    end
  end
end


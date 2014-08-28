require 'punchout/matcher'

module Punchout
  module Matcher
    # Matches when the candidate's class matches the subject class of this matcher, or any
    # *descendant* of that subject.
    #
    # This Matcher is handy for punching against a set of classes that all
    # mixin the same module.
    class Progeny

      include Punchout::Matcher

      def matches?(candidate)
        (@subject <= candidate.class) == true
      end
    end
  end
end

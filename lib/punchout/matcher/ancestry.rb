require 'punchout/matcher'

module Punchout
  module Matcher

      include Punchout::Matcher

      def matches?(candidate)
        (@subject >= candidate.class) == true
      end
    end
  end
end


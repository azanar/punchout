require 'punchout/matcher'

module Punchout
  class Matcher
    class Ancestry < Matcher


      def matches?(candidate)
        (@subject >= candidate.class) == true
      end
    end
  end
end


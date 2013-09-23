require 'punchout/matcher'

module Punchout
  class Matcher
    class Progeny < Matcher
      def match(candidate)
        @list.find {|k|
          k <= candidate.class
        }
      end
    end
  end
end


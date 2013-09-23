require 'punchout/matcher'

module Punchout
  class Matcher
    class Ancestry < Matcher
      def match(candidate)
        candidates = @list.find_all {|k|
          k >= candidate.class
        }
        
        candidates.inject do |a, b| 
          if a < b
            a
          else
            b
          end
        end
      end
    end
  end
end


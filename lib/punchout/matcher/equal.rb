require 'punchout/matcher'

module Punchout
  module Matcher
    class Equal

      include Punchout::Matcher

      def matches?(candidate)
        @subject == candidate
      end
    end
  end
end


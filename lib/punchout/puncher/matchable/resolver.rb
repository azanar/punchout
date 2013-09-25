module Punchout
  class Puncher
    class Matchable
      class Resolver
        def initialize(matcher)
          @matcher = matcher
        end

        def build(thing)
          Matchable.new(@matcher,thing)
        end
      end
    end
  end
end

require 'punchout/puncher/matchable'

module Punchout
  # When a user calls {Punchable#punch} with a `candidate`, each {Matchable} will call {Matcher#matches?} until one returns true.
  module Matcher
    def initialize(subject)
      @subject = subject
    end

    # Creates a {Matchable} assocating this matcher with the thing it should
    # return.
    def punches(thing)
      Punchout::Puncher::Matchable.new(self, thing)
    end

    def conflicts?(other)
      false
    end
  end
end

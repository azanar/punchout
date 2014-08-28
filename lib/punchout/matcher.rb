require 'punchout/puncher/matchable'

module Punchout
  class Matcher
    def initialize(subject)
      @subject = subject
    end

    def punches(thing)
      Punchout::Puncher::Matchable.new(self, thing)
    end

    def conflicts?(other)
      false
    end
  end
end
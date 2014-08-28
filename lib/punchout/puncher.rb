require 'punchout/puncher/matchable'
require 'punchout/puncher/matchables'

module Punchout
  # Every {Punchable} has a {Puncher}, which keeps the details of
  # implementation from littering the namespace of the {Punchable}
  class Puncher
    def initialize
      @matchables = Matchables.new
    end

    # Adds passed {Matchable} to the list of things this {Puncher} can punch
    # 
    # @param matchable [Matchable] a thing this puncher can match on and punch
    # on behalf of
    # @raise [StandardError] if matchable isn't a {Matchable}
    #
    #
    def add(matchable)
      if !matchable.kind_of?(Matchable)
        raise
      end

      @matchables.add(matchable)
    end

    # Indicates whether passed {::Class} is something this {Puncher} would punch
    # if stimulated appropriately
    def can_punch?(type)
      @matchables.include?(type)
    end


    #
    # @return [Array] all of the {::Class}es that can be produced by this {Puncher}
    def all
      @matchables.all.map do |m|
        m.thing
      end
    end

    def punch(type)

      match = @matchables.find(type)

      if match
        match.thing
      end
    end
  end
end


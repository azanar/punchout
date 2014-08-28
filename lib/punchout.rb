require 'punchout/puncher'
require 'punchout/matcher/class'

module Punchout
  # Classes that include this module become punchable.
  #
  # Calling `Instance#punch(obj)`, will return a class, the
  # class of which is determined by one or more characteristics of `obj`
  module Punchable

    # Indicates whether this module is punchable
    #
    # TODO: This method might become an indication of whether any punchers are
    # registered. Or it just might die. Not sure yet.
    def punchable?
      true
    end

    # An instance of something that acts like a {Matcher}
    attr_accessor :matcher

    # The {Puncher} assocated with this punchable.
    #
    # @return [Puncher] a {Puncher}
    def puncher
      @puncher ||= Puncher.new
    end

    # Punches a class based on the object passed and the {Matcher}s tied to
    # this {Punchable}
    #
    # @param obj The object that determines what we punch
    # @return [Class] The {Class} that matched against `obj`
    def punch(obj)
      puncher.punch(obj)
    end
  end
end

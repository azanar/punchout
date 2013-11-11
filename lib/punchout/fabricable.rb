require 'punchout/fabricator'

module Punchout
  module Fabricable
    def puncher
      @puncher ||= Fabricator.new(factory)
    end
  end
end

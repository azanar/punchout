module Punchout
  class Puncher
    # Sanity checks and stores the Matchables behind a {Puncher}
    #
    # @note If two matchers would trigger on the item passed, the first
    #  matcher added wins.
    #
    class Matchables
      def initialize
        @matchables = []
      end

      def add(matchable)
        if conflicts?(matchable)
          raise
        end
        @matchables << matchable
      end

      def include?(type)
        @matchables.any? do |p|
          p.matches?(type)
        end
      end

      def find(type)
        @matchables.find do |p|
          p.matches?(type)
        end
      end

      def all
        @matchables
      end

      private

      def conflicts?(matchable)
        @matchables.any? do |m|
          m.conflicts?(matchable) || matchable.conflicts?(m)
        end
      end
    end
  end
end

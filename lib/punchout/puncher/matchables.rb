module Punchout
  class Puncher
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
        end.tap{|x| "FOUND #{p.inspect}"}
      end

      def find(type)
        @matchables.find do |p|
          p.matches?(type)
        end
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

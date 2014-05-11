require 'chef/formatters/base'

class Chef
  module Formatters
    class Dogeputter < Outputter
      def initialize(out, err)
        super(out, err)
        load_doge
        @current_dogeline = 0
      end

      # XXX color is ignored - maybe if Chef::Config[:color] is off we should load the black-and-white doge?
      def puts(string, *colors)
        if @current_dogeline > @doge.length # no more doge
          printf("%-30s\t  ", " ")
        else
          printf("%-30s\t  ", @doge[@current_dogeline].chomp)
        end
        @out.puts string
      end

      private

      def load_doge
        f = File.open(File.join(%w(.. data doge.txt)))
        @doge = f.readlines
        f.close
      end
    end
  end
end
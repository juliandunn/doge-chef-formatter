require 'chef/formatters/base'

class Chef
  module Formatters
    class Dogeputter < Outputter
      def initialize(out, err)
        super(out, err)
        if Chef::Config[:color]
          load_doge('doge.txt')
        else
          load_doge('doge-ascii.txt')
        end
        @current_dogeline = 0
      end

      def puts(string, *colors)
        if @current_dogeline >= @doge.length # no more doge
          printf("%-47s\t  ", " ")
        else
          printf("%-30s\t  ", @doge[@current_dogeline].chomp)
        end
        @out.puts string
        @current_dogeline += 1
      end

      private

      def load_doge(dogename)
        f = File.open(File.join(File.dirname(__FILE__), '..', '..', '..', 'data', dogename))
        @doge = f.readlines
        f.close
      end
    end
  end
end

require 'chef/formatters/indentable_output_stream'

class Chef
  module Formatters
    class DogeableOutputStream < IndentableOutputStream
      def initialize
        super
        load_doge
        @current_dogeline = 0
      end

      def start_line
        if @current_dogeline > @doge.length # no more doge
          printf("%-30s\t  ", " ")
        else
          printf("%-30s\t  ", @doge[@current_dogeline].chomp)
        end
        super
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
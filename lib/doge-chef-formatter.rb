require 'chef/formatters/minimal'
require 'chef/formatters/dogeputter'

class Chef
  module Formatters
    class Doge < Formatters::Minimal

      cli_name(:doge)

      # Override parent class
      def initialize(out, err)
        @output = Dogeputter.new(out, err)
      end

      # Called at the very start of a Chef Run
      def run_start(version)
        puts "Much Chef Client, version #{version}"
      end
      
      def converge_complete
        puts "System converged. Much resources."
      end

    end
  end
end

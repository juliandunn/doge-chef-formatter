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

    end
  end
end

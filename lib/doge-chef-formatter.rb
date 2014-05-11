# require 'chef/formatters/base'
require 'chef/formatters/minimal'

class Chef
  module Formatters
    class Doge < Formatters::Minimal

      cli_name(:doge)

      # Override parent class
      def initialize(out, err)
        @output = DogeableOutputStream.new(out, err)
      end

    end
  end
end

require 'chef/formatters/minimal'
require 'chef/formatters/dogeputter'

class Chef
  module Formatters
    class Doge < Formatters::Base

      cli_name(:doge)

      # Override parent class
      def initialize(out, err)
        @output = Dogeputter.new(out, err)
      end

      # Called at the very start of a Chef Run
      def run_start(version)
        puts "Starting Chef Client, version #{version}"
      end

      # Called before the cookbook collection is fetched from the server.
      def cookbook_resolution_start(expanded_run_list)
        puts "Very run list: #{expanded_run_list.inspect}"
      end

      def cookbook_sync_start(cookbook_count)
        puts "#{random_doge_prefix} cookbook synchronization"
      end

      # Called when cookbook +cookbook_name+ has been sync'd
      def synchronized_cookbook(cookbook_name)
        puts "  - #{random_doge_prefix.downcase} #{cookbook_name}"
      end

      # Called after all cookbooks have been sync'd.
      def cookbook_sync_complete
        puts "#{random_doge_prefix} finish cookbook synchronization"
      end

      def converge_start(run_context)
        puts "#{random_doge_prefix} converge #{run_context.resource_collection.all_resources.size} resources"
      end

      def converge_complete
        puts 'System converged. Wow. Much resources.'
      end

      # Called when cookbook loading starts.
      def library_load_start(file_count)
        puts "#{random_doge_prefix} compilation"
      end

      def resource_action_start(resource, action, notification_type=nil, notifier=nil)
        if resource.cookbook_name && resource.recipe_name
          resource_recipe = "#{resource.cookbook_name}::#{resource.recipe_name}"
        else
          resource_recipe = "<wow, so much LWRP>"
        end

        if resource_recipe != @current_recipe
          puts "Recipe: #{resource_recipe}"
          @current_recipe = resource_recipe
        end
        puts "  * #{resource} action #{action}"
      end

      private

      def random_doge_prefix
        prefixes = ['wow', 'such', 'very', 'so much', 'many', 'lol', 'beautiful', 'all the', 'the', 'most', 'very much', 'pretty', 'so']
        prefixes[rand(prefixes.length)].capitalize
      end
    end
  end
end

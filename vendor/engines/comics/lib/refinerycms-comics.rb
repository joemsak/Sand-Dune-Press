require 'refinerycms-base'

module Refinery
  module Comics
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "comics"
          plugin.activity = {
            :class => Comic}
        end
      end
    end
  end
end

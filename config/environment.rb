RAILS_GEM_VERSION = '2.3.9' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.autoload_paths += %W( #{RAILS_ROOT}/app/middleware )
  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache"
  config.time_zone = 'UTC'
end
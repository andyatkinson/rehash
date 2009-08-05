$LOAD_PATH.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib') if File.directory?(RAILS_ROOT + '/vendor/plugins/cucumber/lib')

unless ARGV.any? {|a| a =~ /^gems/}

begin
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    t.fork = true
    t.cucumber_opts = ['--format', (ENV['CUCUMBER_FORMAT'] || 'pretty')]
  end
  task :features => 'db:test:prepare'
  
rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end

namespace :features do
  Cucumber::Rake::Task.new(:rcov) do |t|    
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/}
    t.rcov_opts << %[-o "features_rcov"]
  end
end

end
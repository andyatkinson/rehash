namespace :test do
  desc "Run all tests / rake test / rake test:plugins / cucumber features"
  task :all => :environment do
    system("rake test")
    system("rake test:plugins")
    system("cucumber features")
  end
end
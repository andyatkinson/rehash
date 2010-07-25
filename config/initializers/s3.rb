s3config = YAML.load_file("#{RAILS_ROOT}/config/s3.yml")[RAILS_ENV]

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['S3_KEY'] || s3config['access_key_id'],
  :secret_access_key => ENV['S3_SECRET'] || s3config['secret_access_key']
)
if Rails.env.development?
  s3config = YAML.load_file("#{RAILS_ROOT}/config/s3.yml")[RAILS_ENV]
  AWS::S3::Base.establish_connection!(
    :access_key_id     => s3config['access_key_id'],
    :secret_access_key => s3config['secret_access_key']
  )
elsif Rails.env.production?
  # intent is that production environment is on Heroku which uses config vars
  # see: http://docs.heroku.com/config-vars
  AWS::S3::Base.establish_connection!(
    :access_key_id     => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']
  )
end


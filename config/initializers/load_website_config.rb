config_file = Rails.root.join("config", "website_config.yml")
WEBSITE_CONFIG = YAML.load_file(config_file)[Rails.env]

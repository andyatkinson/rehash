#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))
require 'fileutils'

ARTICLES_DIR = Rails.root.join("articles")

FileUtils.mkdir(ARTICLES_DIR) unless File.exists?(ARTICLES_DIR)

Article.all.each do |article|
  file = File.join(ARTICLES_DIR, "#{article.to_param}.yml")
  File.open(file, "w") do |file|
    file.write(article.attributes.slice("title", "description", "body", "published", "published_on", "id").to_yaml)
  end
end



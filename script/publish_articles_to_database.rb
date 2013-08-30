#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))
require 'fileutils'
require 'yaml'

ARTICLES_DIR = Rails.root.join("articles")

FileUtils.mkdir(ARTICLES_DIR) unless File.exists?(ARTICLES_DIR)

file = File.join(ARTICLES_DIR, "10-test.yml")

Dir.glob(File.join(ARTICLES_DIR, "*.yml")) do |file|
  yaml = YAML.load_file(file)

  article = Article.find_or_initialize_by_title(yaml["title"])
  article.id = yaml["id"]
  article.description = yaml["description"]
  article.body = yaml["body"]
  article.published = yaml["published"]
  article.published_on = yaml["published_on"]
  article.save

  puts "Saved article: #{article.title}"
end

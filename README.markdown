## rehash

Rehash is a Ruby on Rails app that can host a personal blog.

Articles are composed using Markdown syntax in a text editor and a generator script is run to turn them into HTML and insert them into a local database. Images that are added to articles must be linkable in development and production. Uploading images manually to S3 is the approach at this time.

When a article has been previewed locally and the author is happy with it, the entire database can be pushed to production. 

Visitors may leave comments on articles for a period of time after the article is published. Authors of comments may edit and delete their comments for a period of time after the comment has been created. This is implemented with cookies so that visitors are not required to create an account or log in.

### Installation

Once bundler is installed, install the gems with the `bundle` command, create a `database.yml` file from the sample, create a `.env` file from the sample, and supply both your database credentials and environment variables. 

If you start the application with foreman, your `.env` environment variables will be set. To [add Heroku configuration variables](https://devcenter.heroku.com/articles/config-vars) reference this article.

    bundle
    cp config/database.sample.yml config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate
    cp .sample.env .env 
    foreman start

#### Adding Heroku config vars

    heroku config:set GITHUB_USERNAME=joesmith

To view variables or verify that a new one was added:

    heroku config

#### Pulling the database from Heroku

I'm using mysql locally so I still want to use the Heroku `db:pull` functionality via the taps gem to pull the local tables from postgres down to mysql. The project is currently set up to do this.

    heroku db:pull

After this to dump the articles to plain text files. Run `dos2unix` on each article as well.

    rm articles/*
    ./script/rehash dump
    dos2unix articles/*

When articles are created and updated, push the changes to Heroku:

    heroku db:push

#### Converting an existing blog

To dump articles from a database to text files:

    ./script/rehash dump

This will put plain text files in the "articles" directory at the Rails root, which is ignored from git. To remove line ending characters the `dos2unix` program can be used. To remove the characters for all articles, run: `dos2unix articles/*`.

To create a new article template, where you can start writing the metadata and content of the article:

    ./script/rehash generate

Finally when you are ready to publish everything in the "articles" directory:

    ./script/rehash publish


### Testing

Rehash uses Test::Unit and tries to keep the tests simple and with good coverage of controllers and models. In the past Rehash used Cucumber and shoulda, but this became difficult to maintain and they have been removed.

    rake

#### MIT License

Copyright (c) 2009-2013 Andy Atkinson

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

rehash
===
Rehash is a Ruby on Rails app that can host a personal blog. The intended audience is programmers as it does not have an administrative UI. The code for the app favors making it easier to upgrade Rails and gem versions so it uses few gems. 

To create new articles, borrowing from the concept of a static site generator, articles are composed using Markdown syntax in a text editor and a generator script is run to turn them into HTML and insert them into a local database. Images that are added to articles must be linkable in development and production. Uploading images manually to S3 is the approach at this time.

No plugins are used for tags on articles, slugs on articles, or image uploads.

When a article has been previewed locally and the author is happy with it, the entire database can be pushed to production. 

Visitors may leave comments on articles for a period of time after the article is published. Authors of comments may edit and delete their comments for a period of time after the comment has been created. This is implemented with cookies so that visitors are not required to create an account or log in.

### Installation

If you wish to develop for Rehash, create a gemset and install bundler. A gemset name and ruby version are specified in the project. Once bundler is installed, install the gems with the `bundle` command, create a `database.yml` file from the sample, create a `.env` file from the sample, and supply both your database credentials and environment variables. 

If you start the application with foreman, your `.env` environment variables will be set. To [add Heroku configuration variables](https://devcenter.heroku.com/articles/config-vars) reference this article.

    bundle
    cp config/database.sample.yml config/database.yml
    bundle exec rake db:create
    bundle exec rake db:migrate
    cp .sample.env .env 
    foreman start

Converting an existing blog
===========================
Scripts in the `script` directory can be used to convert from database articles to text files (yml) in the `articles` directory at the application root. There is a script that also publishes text yml files to database records. Note that foreign keys like the article_id on comments must remain intact.

Eventually a generator will be added to start a blank article template.
    

### Testing

Rehash uses test unit and tries to keep the tests very simple using test unit, and having good coverage of controllers and models. In the past Rehash used Cucumber and shoulda with nested contexts, but this became difficult to maintain and they have both since been removed in favor of simple tests.

    rake

### MIT License

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

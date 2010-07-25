rehash
===
*Rehash is a personal publishing application with an emphasis on simplicity and well-tested code.*

Rehash was created by [Andy Atkinson](http://webandy.com).

### Install and Documentation

Please see the INSTALL file for set up instructions. Please see the [Rehash Github wiki](http://wiki.github.com/webandy/rehash) for documentation.


### Philosophy

Rehash is a minimal publishing application focused on providing a very well-tested Ruby application others can understand and use with confidence. Rehash can serve as a base app suitable for forking, or works great as is for personal blogging and portfolio display. Third party code in rehash was selected for solving a specific problem well, and being tested and updated regularly. Functionality is designed to degrade gracefully, e.g. file uploads and theme switching work without JavaScript. Ajax is added to certain features where full page loads are not ideal.


### Testing

Rehash is covered by [Cucumber](http://cukes.info/) features throughout the app. The Cucumber screencasts [1] [2] from Ryan Bates are excellent resources when getting started. [Shoulda](http://www.thoughtbot.com/projects/shoulda/) is used for controller and model tests. [Blue-ridge](http://github.com/relevance/blue-ridge) will be used for JavaScript testing. Run JavaScript tests with the `rake test:javascripts` command.

[1] [Beginning with Cucumber](http://railscasts.com/episodes/155-beginning-with-cucumber)
[2] [More on Cucumber](http://railscasts.com/episodes/159-more-on-cucumber)


### Plugins and gems

`acts_as_taggable_on_steroids` [Github](http://github.com/jviney/acts_as_taggable_on_steroids/tree/master) Contact person: [Jonathan Viney](mailto:jonathan.viney@gmail.com)

`acts_as_markup` [Github](http://github.com/vigetlabs/acts_as_markup/tree/master) Contact person: [Brian Landau](mailto:brian.landau@viget.com)

`friendly_id` [Github](http://github.com/norman/friendly_id/tree/master) [RDoc](http://friendly-id.rubyforge.org/) Authors: [Norman Clarke](mailto:norman@randomba.org), [Adrian Mugnolo](mailto:adrian@randomba.org), [Emilio Tagua](mailto:miloops@gmail.com)

`make_resourceful` [Github](http://github.com/hcatlin/make_resourceful/tree/master) Authors: [Hampton Catlin](mailto:contact@hamptoncatlin.com), Nathan Weizenbaum, and Jeff Hardy

`haml` [Website](http://haml-lang.com/) and `sass` [Website](http://sass-lang.com/)

`will_paginate` [Website](http://github.com/mislav/will_paginate) Contact person: [Mislav](mailto:mislav.marohnic@gmail.com)

`gravtastic` [Website](http://github.com/chrislloyd/gravtastic) Author: [Chris Lloyd](mailto:christopher.lloyd@gmail.com)

`paperclip` from [Thoughtbot](http://thoughtbot.com)

`sass_on_heroku` from [Heroku](http://heroku.com)

`aws-s3`

### Uploads
More details soon on S3 and Heroku.

### Credits

Much credit goes to [Ryan Bates](http://www.workingwithrails.com/person/6491-ryan-bates) and his [Railscasts.com](http://railscasts.com/) screencasts.


### MIT License

Copyright (c) 2009 Andy Atkinson http://webandy.com

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
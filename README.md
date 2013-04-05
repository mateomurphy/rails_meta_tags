# rails_meta_tags

[![Dependency Status](https://gemnasium.com/mateomurphy/rails_meta_tags.png)](https://gemnasium.com/mateomurphy/rails_meta_tags)

Easy meta tag generation for rails apps

## Supported properties

* title
* type - og
* image - og
* url - og
* description - og
* audio - og
* determiner
* locale - og
* site_name
* video - og
* keywords
* robots
* creator - dc
* subject - dc
* publisher - dc
* created - dc
* identifier - dc
* language
* content_type
* viewport

Properties marked "og" and "dc" will be mapped to their open graph and dublin core properties, respectively

## Global config

    Rails::MetaTags.config do |config|
      config.defaults.site_name   "Site name"
      config.defaults.creator     "Creator"
      config.defaults.publisher   "Publisher"
      config.defaults.identifier  :canonical_url
      config.defaults.url         :canonical_url
      config.defaults.image       :mutek_logo_url
      config.defaults.description :default_description
      config.defaults.viewport    "width=device-width"
    end

Strings will be used as is, symbols will be called as instance methods on the current controller

## Usage in controllers

    class Admin::BaseController < ApplicationController
      def set_title
        meta.title = "#{controller_name.humanize} - #{action_name.humanize}"
        meta.resource = resource if params[:id] && respond_to?(:resource)
      end
    end

Strings will be used as is, symbols will be called as instance methods on the current controller.

The `resource` property accepts a model that has a meta block declaration. The values defined there will over ride those set in the controller.

## Usage in models

    class Post < ActiveRecord::Base
      meta do
        type 'article'
        title :title
        description :subtitle
        image :og_image
      end
    end

Strings will be used as is, symbols will be called as instance methods on the model.


## Inspiration

https://github.com/kpumuk/meta-tags

## Contributing to rails_meta_tags
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Mateo Murphy. See LICENSE.txt for
further details.


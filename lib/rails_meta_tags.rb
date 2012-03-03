require 'active_support/concern'
require 'active_support/core_ext/module'
require 'rails/meta_tags'

ActionController::Base.send :include, Rails::MetaTags::ControllerMethods if defined?(ActionController)
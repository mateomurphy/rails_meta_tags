module Rails
  module MetaTags
    autoload :ControllerMethods,  'rails/meta_tags/controller_methods'
    autoload :Builder,            'rails/meta_tags/builder'
  
    mattr_accessor :site_name
    @@site_name = "SITE"
  
    mattr_accessor :seperator
    @@seperator = " | "
    
    mattr_accessor :creator
    
    mattr_accessor :publisher
    
    def self.config
      yield self
    end
  end
end
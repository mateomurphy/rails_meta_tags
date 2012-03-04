module Rails
  module MetaTags
    autoload :ControllerMethods,  'rails/meta_tags/controller_methods'
    autoload :Builder,            'rails/meta_tags/builder'
    autoload :ModelSupport,       'rails/meta_tags/model_support'
  
    PROPERTIES = [
      :title,
      :type,
      :image,
      :url,
      :description,
      :audio,
      :determiner,
      :locale,
      :site_name,
      :video,
      :keywords,
      :robots,
      :creator,
      :subject,
      :publisher,
      :created,
      :identifier,
      :language,
      :content_type
    ]  
  
    mattr_accessor :site_name
    @@site_name = "SITE"
  
    mattr_accessor :seperator
    @@seperator = " | "
    
    mattr_accessor :creator
    
    mattr_accessor :publisher
    
    def self.config
      yield self
    end
    
    def self.defaults
      {
        :site_name => MetaTags.site_name,
        :type => "website",  
        :content_type => "text/html; charset=utf-8",
        :created => Time.new.strftime('%Y-%m-%d'),
        :language => I18n.locale.to_s,
        :creator => MetaTags.creator,
        :publisher => MetaTags.publisher || MetaTags.creator
      }      
    end
    
  end
end
module Rails
  module MetaTags
    autoload :ControllerMethods,  'rails/meta_tags/controller_methods'
    autoload :Builder,            'rails/meta_tags/builder'
    autoload :Config,             'rails/meta_tags/config'    
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
  
    mattr_accessor :seperator
    @@seperator = " | "

    def self.config
      yield self
    end
    
    def self.defaults
      @defaults ||= Config.new
    end

    # default config
    defaults.site_name    "SITE"
    defaults.type         "website"
    defaults.content_type "text/html; charset=utf-8"
    defaults.created      lambda { |c| Time.new.strftime('%Y-%m-%d') }
    defaults.language     lambda { |c| I18n.locale.to_s }
    defaults.identifier   lambda { |c| c.request.url }
    defaults.url          lambda { |c| c.request.url }
  end
end
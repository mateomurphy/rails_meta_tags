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
      :content_type,
      :viewport
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
    defaults.created      { |c| Time.new.strftime('%Y-%m-%d') }
    defaults.language     { |c| I18n.locale.to_s }
    defaults.identifier   { |c| c.request.url }
    defaults.url          { |c| c.request.url }
    defaults.viewport     "width=device-width"
  end
end
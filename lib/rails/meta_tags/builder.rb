# Information on tags http://www.webreference.com/xml/column24/2.html

module Rails
  module MetaTags
    class Builder
      delegate :request, :tag, :content_tag, :to => :@view_context
      
      # The name of the resource.
      attr_accessor :title

      # An account of the content of the resource.
      # Could be an abstract, table of contents, reference to a graphical representation of the content or a summary.
      attr_accessor :description
  
      attr_accessor :keywords
      
      attr_accessor :robots
      
      # Entity responsible for creating the resource
      # Culd ba a person, organization, or service
      attr_accessor :creator
      
      # The topic of the content of the resource.
      # Typically expressed as keywords, key phrases or classification codes. 
      # Ideally select a value from a controlled vocabulary or formal classification scheme.
      attr_accessor :subject
      
      # The entity responsible for making the resource available.
      # Can be same or different from creator.
      attr_accessor :publisher
      
      # Follows the YYYY-MM-DD format.
      attr_accessor :created
      
      attr_accessor :identifier
      
      attr_accessor :language
      
      attr_accessor :content_type
      
      DC_TERMS = %w(title creator subject created language identifier publisher)
      
      def initialize(view_context)
        @view_context = view_context
        
        # default values
        self.content_type = "text/html; charset=utf-8"
        self.created = Time.new.strftime('%Y-%m-%d')
        self.identifier = request.url
        self.language = I18n.locale
        self.creator = MetaTags.creator
        self.publisher = MetaTags.publisher || MetaTags.creator
      end
  
      def full_title
        [@title, MetaTags.site_name].flatten.join(MetaTags.seperator).html_safe
      end

      def value_present?(term)
        respond_to?(term) && send(term).present?
      end
  
      def render_tags
        tags = []
        tags << content_tag(:title, full_title)
        tags << tag(:meta, :'http-equiv' => "Content-Type", :content => content_type)
        
        DC_TERMS.each do |term|
          tags << tag(:meta, :name => "dcterms.#{term}", :content => send(term)) if value_present?(term)
        end
        
        tags.join("\n").html_safe
      end
    end
  end
end
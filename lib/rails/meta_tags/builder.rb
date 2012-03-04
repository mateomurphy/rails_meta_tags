# Information on tags http://www.webreference.com/xml/column24/2.html

module Rails
  module MetaTags
    class Builder
      delegate :request, :tag, :content_tag, :to => :@view_context
      
      attr_accessor :resource
      
      DC_TERMS = %w(title creator subject created language identifier publisher)
      OG_PROPERTIES= %w(title type image url audio description locale site_name video)
      
      def initialize(view_context)
        @view_context = view_context
        @data = MetaTags.defaults
        @data[:identifier] = request.url
      end
  
      PROPERTIES.each do |t|
        class_eval "def #{t}=(val); self[:#{t}] = val; end"
        class_eval "def #{t}; self[:#{t}]; end"        
      end
  
      def [](tag)
        if resource
          resource.meta[tag.to_sym] || @data[tag.to_sym]
        else
          @data[tag.to_sym]
        end
      end
  
      def []=(tag, value)
        @data[tag.to_sym] = value
      end  
  
      def full_title
        return MetaTags.site_name unless value_present?(:title)
        [self[:title], MetaTags.site_name].flatten.join(MetaTags.seperator).html_safe
      end

      def value_present?(term)
        self[term].present?
      end
  
      def render_tags
        tags = []
        tags << content_tag(:title, full_title)
        tags << tag(:meta, :'http-equiv' => "Content-Type", :content => content_type)
        
        DC_TERMS.each do |term|
          tags << tag(:meta, :name => "dcterms.#{term}", :content => self[term]) if value_present?(term)
        end
        
        OG_PROPERTIES.each do |property|
          tags << tag(:meta, :name => "og:#{property}", :content => self[property]) if value_present?(property)
        end
        
        tags.join("\n").html_safe
      end
    end
  end
end
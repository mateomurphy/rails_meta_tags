# Information on tags http://www.webreference.com/xml/column24/2.html

module Rails
  module MetaTags
    class Builder
      delegate :request, :tag, :content_tag, :to => :@view_context
      
      attr_accessor :resource
      
      DC_TERMS = %w(creator subject created language identifier publisher)
      OG_PROPERTIES= %w(type image url audio description locale site_name video)
      
      def initialize(view_context)
        @view_context = view_context
        @data = MetaTags.defaults.to_hash
      end
  
      PROPERTIES.each do |t|
        class_eval "def #{t}=(val); self[:#{t}] = val; end"
        class_eval "def #{t}; self[:#{t}]; end"        
      end
  
      def [](tag)
        tag = tag.to_sym
        
        return resource.meta[tag] if resource && resource.meta[tag].present?
        
        if @data[tag].is_a?(Symbol)
          @view_context.send(@data[tag])
        elsif @data[tag].respond_to?(:call)
          @data[tag].call(@view_context)
        else
          @data[tag]
        end
      end
  
      def []=(tag, value)
        @data[tag.to_sym] = value
      end  
  
      def full_title
        if value_present?(:title)
          [self[:title], MetaTags.defaults[:site_name]].flatten.join(MetaTags.seperator).html_safe
        else
          MetaTags.defaults[:site_name]
        end
      end

      def title_or_site_name
        if value_present?(:title)
          self[:title]
        else
          MetaTags.defaults[:site_name]
        end
      end

      def value_present?(term)
        self[term].present?
      end
  
      def render_tags
        tags = []
        tags << content_tag(:title, full_title)
        tags << tag(:meta, :name => 'description', :content => description)
        tags << tag(:meta, :'http-equiv' => "Content-Type", :content => content_type)
        
        tags << tag(:meta, :name => "dcterms.title", :content => title_or_site_name)
        DC_TERMS.each do |term|
          tags << tag(:meta, :name => "dcterms.#{term}", :content => self[term]) if value_present?(term)
        end
        
        tags << tag(:meta, :property => "og.title", :content => title_or_site_name)        
        OG_PROPERTIES.each do |property|
          tags << tag(:meta, :property => "og:#{property}", :content => self[property]) if value_present?(property)
        end
        
        tags.join("\n").html_safe
      end
    end
  end
end
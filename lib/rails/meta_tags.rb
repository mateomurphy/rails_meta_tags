class MetaTags
  cattr_accessor :site_name
  
  cattr_accessor :seperator
  @@seperator = " | "
  
  attr_accessor :title
  
  def initialize(view_context)
    @view_context = view_context
  end
  
  def full_title
    [@title, site_name].flatten.join(seperator).html_safe
  end
  
  def render_tags
    @view_context.content_tag :title, full_title
  end
  
end
module LayoutHelper
  
  def site_title
    "Untitled Site"
  end
  
  def meta_data
    output = []
    output << content_tag(:title, page_title)
    output << tag(:meta, :name => 'description', :content => page_description) if page_description
    output << tag(:meta, :name => 'keywords', :content => page_keywords) if page_keywords
    output.join("\n")
  end
  
  def page_title
    @page_title ? "#{@page_title} | #{site_title}" : site_title
  end
  
  def page_description
    @page_description || nil
  end
  
  def page_keywords
    if @page_keywords
      case @page_keywords
      when Array
        @page_keywords.join(' ')
      else
        @page_keywords
      end
    else
      nil
    end
  end
  
  def classy_flash
    items = []
    flash.each do |key, msg|
      items << content_tag(:div, msg, :class => key)
    end
    content_tag :div, items.join("\n"), :id => 'flash'
  end
  
  def body_id
    [params[:controller].gsub('/', '_'), params[:action]].join('_')
  end
  
end
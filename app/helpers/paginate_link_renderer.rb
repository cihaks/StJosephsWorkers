class PaginateLinkRenderer < WillPaginate::LinkRenderer
  def prepare(collection, options, template)
    @remote = options.delete(:remote) || {}
    super
  end

protected
  def page_link(page, text, attributes = {})
    if @remote.empty?
      @template.link_to text, url_for(page), attributes
    else
      @template.link_to_remote(text, {:url => url_for(page), :method => :get}.merge(@remote), attributes)
    end
  end
end
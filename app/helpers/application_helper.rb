module ApplicationHelper
	include Rails.application.routes.url_helpers

   	def cancel_link
      return link_to 'Cancel', request.env["HTTP_REFERER"], 
        :class => 'cancel btn btn-large',
        :confirm => 'Are you sure? Any changes will be lost.'
    end

   # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "connecticut"
    if page_title.empty?
      base_title
    else
      "#{base_title} / #{page_title}"
    end
  end
end

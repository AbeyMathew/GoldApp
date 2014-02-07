module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Gold Jewelery Price Calculator"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

#  @pure_gram_karat = 24
#  @troy_ounce = 31.1

end

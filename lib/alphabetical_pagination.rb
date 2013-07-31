module AlphabeticalPagination

  ALL_LETTERS = ('A'..'Z').to_a

  def alphabetically_paginate(collection, options = {})
        content_tag(:ul, safe(alphabetical_links_to(ALL_LETTERS)),
                  :class => options[:class] || "pagination")
  end

  def safe(content)
      if content.respond_to?(:html_safe)
        return content.html_safe
      end
      content
  end

  def alphabetical_links_to(available_letters)
      ('A'..'Z').map do |letter|
        if (params[:letter]||'A') == letter 
          content_tag(:li, link_to(letter, "#{request.path}?letter=#{letter}"), :class => 'active')
        else
          content_tag(:li, link_to(letter, "#{request.path}?letter=#{letter}"), :class => 'inactive')
        end
      end.join(" ")
  end

end

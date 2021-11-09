# frozen_string_literal: true

# ArticlesHelper module
module ArticlesHelper
  def author_message_article(object)
    "#{object.user.name} on #{colombian_date(object.created_at)} wrote the following article:"
  end
end

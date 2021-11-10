# frozen_string_literal: true

# CommentsHelper module
module CommentsHelper
  def author_message_comment(object)
    "#{object.user.name} on #{colombian_date(object.created_at)} commented the following:"
  end
end

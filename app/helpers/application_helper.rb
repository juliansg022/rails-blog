# frozen_string_literal: true

# ApplicationHelper module
module ApplicationHelper
  include Pagy::Frontend

  def colombian_date(date)
    # To convert UTC to UTC-5
    my_date = date - (60 * 60 * 5)
    # to display date as 'November 05, 2021 at 12:57:15PM'
    my_date.strftime('%B %d, %Y at %I:%M:%S%p')
  end

  def author_message(object)
    case object.class.to_s
    when 'Comment'
      "#{object.user.name} at #{colombian_date(object.created_at)} commented the following:"
    when 'Article'
      "#{object.user.name} at #{colombian_date(object.created_at)} wrote the following article:"
    else
      'Unexpected object'
    end
  end
end

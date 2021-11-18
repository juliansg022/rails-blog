# frozen_string_literal: true

# ApplicationHelper module
module ApplicationHelper
  include Pagy::Frontend

  def colombian_date(date)
    if date.instance_of?(Time)
      # To convert UTC to UTC-5
      my_date = date - (60 * 60 * 5)
      # to display date as 'November 05, 2021 at 12:57:15PM'
      my_date.strftime('%B %d, %Y at %I:%M:%S%p')
    else
      'Invalid object'
    end
  end
end

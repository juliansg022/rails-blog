require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  it 'is not a valid object to convert to colombian time' do
    other_object = colombian_date(5)
    expect(other_object).to eq('Invalid object')
  end

  it 'is a valid object to convert to colombian time' do
    my_time = colombian_date(Time.now)
    date_format = Time.parse(my_time)
    expect(date_format.class).to eq(Time)
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:my_time) { Time.new(2021, 11, 11, 20, 17, 25, 0o000) }

  describe '#colombian_date' do
    it 'is not a valid object to convert to colombian time' do
      expect(helper.colombian_date(5)).to eq('Invalid object')
    end

    it 'is a valid object to convert to colombian time' do
      expect(helper.colombian_date(my_time)).to eq('November 11, 2021 at 03:17:25PM')
    end
  end
end

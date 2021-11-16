# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { create(:user) }

  describe 'Associations' do
    subject { create(:article, user: user) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    context 'when is a valid article' do
      subject { create(:article, user: user) }
      it { is_expected.to validate_presence_of(:user) }

      it { is_expected.to be_valid }
    end

    context 'when a valid attribute is missing' do
      it 'is not valid without a title' do
        subject { create(:article, user: user, title: nil) }
        is_expected.not_to be_valid
      end

      it 'is not valid without a body' do
        subject { create(:article, user: user, body: nil) }
        is_expected.not_to be_valid
      end

      it 'is not valid without a status' do
        subject { create(:article, user: user, status: nil) }
        is_expected.not_to be_valid
      end

      it 'is not valid without a user' do
        subject { create(:article) }
        is_expected.not_to be_valid
      end
    end
  end
end

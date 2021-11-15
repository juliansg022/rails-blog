# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) do
    User.create(name: 'User to Test', email: 'user@mail.com', password: 'password',
                password_confirmation: 'password')
  end
  subject do
    described_class.create(title: 'Anything',
                           body: 'Lorem ipsum',
                           status: 'public',
                           user: user)
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to be_valid }

    it 'is not valid without a title' do
      subject.title = nil
      is_expected.not_to be_valid
    end

    it 'is not valid without a body' do
      subject.body = nil
      is_expected.not_to be_valid
    end

    it 'is not valid without a status' do
      subject.status = nil
      is_expected.not_to be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      is_expected.not_to be_valid
    end
  end
end

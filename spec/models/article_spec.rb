# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) {
    User.create(name: 'User to Test', email: 'user@mail.com', password: 'password',
                password_confirmation: 'password')
  }
  subject(:article) {
    described_class.create(title: 'Anything',
                           body: 'Lorem ipsum',
                           status: 'public',
                           user: user)
  }

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:user) }

    it 'is valid with valid attributes' do
      expect(article.valid?).to be(true)
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(article.valid?).not_to be(true)
    end

    it 'is not valid without a body' do
      subject.body = nil
      expect(article.valid?).not_to be(true)
    end

    it 'is not valid without a status' do
      subject.status = nil
      expect(article.valid?).not_to be(true)
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(article.valid?).not_to be(true)
    end
  end
end

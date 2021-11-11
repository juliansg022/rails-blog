# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) {
    User.create(name: 'User to Test', email: 'user@mail.com', password: 'password',
                password_confirmation: 'password')
  }

  let(:article) {
    Article.create(title: 'Anything',
                   body: 'Lorem ipsum',
                   status: 'public',
                   user: user)
  }

  describe 'create' do
    it 'is created successfully' do
      comment = Comment.create(commenter: user.name, body: 'My first comment', status: 'public', article: article, user: user)
      expect(comment.valid?).to be(true)
    end
  end

  describe 'destroy' do
    it 'is deleted successfully' do
      com = Comment.create(commenter: user.name, body: 'My first comment', status: 'public', article: article, user: user)
      id_com = com.id
      com.destroy
      com = Comment.where(id: id_com)
      expect(com.empty?).to be(true)
    end
  end
end

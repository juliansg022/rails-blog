# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) do
    User.create(name: 'User to Test',
                email: 'user@mail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  let(:article) do
    Article.create(title: 'Anything',
                   body: 'Lorem ipsum',
                   status: 'public',
                   user: user)
  end

  let(:article_id) { article.id }

  subject do
    response
  end

  # Test suite for GET
  describe 'GET' do
    context '.index of articles via GET' do
      it 'returns status code 200 because access was successful' do
        get :index
        is_expected.to have_http_status(200)
      end
    end

    context '.show an article via GET' do
      it 'returns status code 200 because access was successful' do
        get :show, params: { id: article_id }
        is_expected.to have_http_status(200)
      end
    end

    context '.new article form via GET' do
      it 'returns status code 200 because access was successful' do
        sign_in(user)
        get :new
        is_expected.to have_http_status(200)
      end

      it 'returns status code 302 because not logged in and has been redirected' do
        get :new
        is_expected.to have_http_status(302)
      end
    end

    context '.edit an article via GET' do
      it 'returns status code 200 because access was successful' do
        sign_in(user)
        get :edit, params: { id: article_id }
        is_expected.to have_http_status(200)
      end
      it 'returns status code 302 because not logged in and has been redirected' do
        get :edit, params: { id: article_id }
        is_expected.to have_http_status(302)
      end
    end
  end

  # Test suite for POST
  describe '.create an article via POST' do
    let(:valid_attributes) do
      {
        body: 'my first article from test',
        title: 'Articles title',
        status: 'public',
        user: user
      }
    end
    let(:invalid_attributes) do
      {
        body: 'my first article from test',
        title: 'Articles title',
        status: 'secret',
        user: user
      }
    end

    before do
      sign_in(user)
      get :new
    end

    it 'returns status code 302 because it was successfully created and has been redirected' do
      post :create, params: { article: valid_attributes }
      is_expected.to have_http_status(302)
    end

    it 'returns status code 200 because it remains in the new view until you can create with valid attributes' do
      post :create, params: { article: invalid_attributes }
      is_expected.to have_http_status(200)
    end
  end

  # Test suite for PATCH
  describe '.update an article via PATCH' do
    let(:valid_attributes) do
      {
        body: 'my first article from test',
        title: 'Articles title',
        status: 'public'
      }
    end
    let(:invalid_attributes) do
      {
        body: 'my first article from test',
        title: 'Articles title',
        status: 'secret'
      }
    end

    before do
      sign_in(user)
      get :edit, params: { id: article_id }
    end

    it 'returns status code 302 because it was successfully updated and has been redirected' do
      patch :update, params: { id: article_id, article: valid_attributes }
      is_expected.to have_http_status(302)
    end

    it 'returns status code 200 because it remains in the edit view until you can update with valid attributes' do
      patch :update, params: { id: article_id, article: invalid_attributes }
      is_expected.to have_http_status(200)
    end
  end

  # Test suite for PUT
  describe '.update an article via PUT' do
    let(:valid_attributes) do
      {
        body: 'my first article from test',
        title: 'Articles title',
        status: 'public'
      }
    end
    let(:invalid_attributes) do
      {
        body: 'my first article from test',
        title: 'Articles title',
        status: 'secret'
      }
    end

    before do
      sign_in(user)
      get :edit, params: { id: article_id }
    end

    it 'returns status code 302 because it was successfully updated and has been redirected' do
      put :update, params: { id: article_id, article: valid_attributes }
      is_expected.to have_http_status(302)
    end

    it 'returns status code 200 because it remains in the edit view until you can update with valid attributes' do
      put :update, params: { id: article_id, article: invalid_attributes }
      is_expected.to have_http_status(200)
    end
  end

  # Test suite for DELETE
  describe '.destroy an article via DELETE' do
    before do
      delete :destroy, params: { id: article_id }
    end

    it 'returns status code 302 because it was successfully deleted and has been redirected' do
      sign_in(user)
      is_expected.to have_http_status(302)
    end
  end
end

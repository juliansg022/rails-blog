# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User to test #{n}" }
    sequence(:email) { |n| "usertest#{n}@email.com" }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end

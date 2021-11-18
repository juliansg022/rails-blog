# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Article to test #{n}" }
    body { Faker::Lorem.paragraphs }
    status { 'public' }
    user { nil }
  end
end

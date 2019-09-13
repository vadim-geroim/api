FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    sequence(:slug) { |n| "my-article-#{n}" }
  end
end

FactoryBot.define do
  factory :article do
    title { 'タイトル' }
    text { '説明' }
    price { '10万円' }

    # association :user

    after(:build) do |article|
      article.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

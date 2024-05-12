FactoryBot.define do
  factory :chat_message do
    role { "user" }
    content { Faker::Lorem.sentence }
  end
end

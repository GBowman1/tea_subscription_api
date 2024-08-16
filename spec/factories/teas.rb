FactoryBot.define do
  factory :tea do
    title { "Sweet Tea" }
    description { "Tea So Sweet It Will Make your Teeth Fall Out" }
    temperature { 153 }
    brew_time { 3 }
  end
end
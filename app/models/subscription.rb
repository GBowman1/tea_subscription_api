class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  enum status: { active: 1, cancelled: 2 }
end

class SubscriptionSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :title, :status, :frequency, :tea_id

  attribute :price do |object|
    object.price.to_s
  end
  belongs_to :customer, serializer: CustomerSerializer
end
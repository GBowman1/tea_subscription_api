require "rails_helper"

RSpec.describe SubscriptionSerializer do
  let (:customer) { create(:customer) }
  let (:tea) { create(:tea) }
  let(:subscription) { customer.subscriptions.create(title: "Monthly Subscription", price: 10.00, status: "active", frequency: 1, tea_id: tea.id) }
  
  it "serializes a subscription" do
    serialized = SubscriptionSerializer.new(subscription).serializable_hash

    expect(serialized).to eq(
      {
        data: {
          id: subscription.id.to_s,
          type: :subscription,
          attributes: {
            title: subscription.title,
            price: subscription.price.to_s,
            status: subscription.status,
            frequency: subscription.frequency.to_s,
            tea_id: subscription.tea_id
          },
          relationships: {
            customer: {
              data: {
                id: subscription.customer_id.to_s,
                type: :customer
              }
            }
          }
        }
      }
    )
  end
end
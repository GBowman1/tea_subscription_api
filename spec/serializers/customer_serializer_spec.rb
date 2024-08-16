require "rails_helper"

RSpec.describe CustomerSerializer do
  let (:customer) { create(:customer) }
  it "serializes a customer" do
    serialized = CustomerSerializer.new(customer).serializable_hash

    expect(serialized).to eq(
      {
        data: {
          id: customer.id.to_s,
          type: :customer,
          attributes: {
            first_name: customer.first_name,
            last_name: customer.last_name,
            email: customer.email,
            address: customer.address
          }
        }
      }
    )
  end
end
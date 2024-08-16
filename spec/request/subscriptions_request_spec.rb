require "rails_helper"

RSpec.describe "Subscriptions", type: :request do
  describe "POST /api/v1/customers/:customer_id/subscriptions" do
    it "creates a subscription for a customer" do
      customer = create(:customer)
      tea = create(:tea)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: {
        subscription: {
          title: "Monthly Subscription",
          price: 10.00,
          status: "active",
          frequency: 1,
          tea_id: tea.id
        }
      }

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes][:title]).to eq("Monthly Subscription")
      expect(json[:data][:attributes][:price]).to eq("10.0")
      expect(json[:data][:attributes][:status]).to eq("active")
      expect(json[:data][:attributes][:frequency]).to eq("1")
      expect(json[:data][:attributes][:tea_id]).to eq(tea.id)
    end

    it "returns an error if subscription is not created" do
      customer = create(:customer)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: {
        subscription: {
          title: "Monthly Subscription",
          price: 10.00,
          status: "active",
          frequency: 1
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error][:message]).to eq("Error Creating Subscription")
      expect(json[:error][:status]).to eq(422)
    end
  end
  describe "DELETE /api/v1/subscriptions/:id" do
    it "cancels a subscription" do
      customer = create(:customer)
      tea = create(:tea)
      subscription = customer.subscriptions.create(title: "Monthly Subscription", price: 10.00, status: "active", frequency: 1, tea_id: tea.id)

      delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes][:status]).to eq("cancelled")
    end

    it "returns an error if subscription is not cancelled" do
      customer = create(:customer)
      tea = create(:tea)
      subscription = customer.subscriptions.create(title: "Monthly Subscription", price: 10.00, status: "active", frequency: 1, tea_id: tea.id)

      allow_any_instance_of(Subscription).to receive(:update).and_return(false)

      delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error][:message]).to eq("Error Cancelling Subscription")
      expect(json[:error][:status]).to eq(422)
    end
  end
  describe "GET /api/v1/customers/:customer_id/subscriptions" do
    it "returns a list of subscriptions for a customer" do
      customer = create(:customer)
      tea = create(:tea)
      tea_2 = create(:tea)
      customer.subscriptions.create(title: "Monthly Subscription", price: 10.00, status: "active", frequency: 1, tea_id: tea.id)
      customer.subscriptions.create(title: "Weekly Subscription", price: 5.00, status: "active", frequency: 7, tea_id: tea_2.id)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].count).to eq(2)
      expect(json[:data].first[:attributes][:title]).to eq("Monthly Subscription")
      expect(json[:data].first[:attributes][:price]).to eq("10.0")
      expect(json[:data].first[:attributes][:status]).to eq("active")
      expect(json[:data].first[:attributes][:frequency]).to eq("1")
      expect(json[:data].first[:attributes][:tea_id]).to eq(tea.id)
    end
  end
end
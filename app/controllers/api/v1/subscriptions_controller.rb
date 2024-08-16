class Api::V1::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    subscription = customer.subscriptions.create(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: ErrorSerializer.serialize(ErrorMessage.new("Error Creating Subscription", 422)), status: :unprocessable_entity
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])
    if subscription.update(status: :cancelled)
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: ErrorSerializer.serialize(ErrorMessage.new("Error Cancelling Subscription", 422)), status: :unprocessable_entity
    end
  end

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_id)
  end
end
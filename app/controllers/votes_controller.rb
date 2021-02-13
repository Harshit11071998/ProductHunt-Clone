class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    product.votes.create(user: current_user)
    redirect_to request.referrer
  end

  def destroy
    product = Product.find(params[:product_id])
    product.votes.where(user: current_user).take.try(:destroy)
    redirect_to request.referrer
  end
end

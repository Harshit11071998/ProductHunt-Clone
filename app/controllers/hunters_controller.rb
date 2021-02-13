class HuntersController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])
    product.hunter.create(user: current_user)
    # hunter.name = current_user.name
    redirect_to request.referrer
  end

  def destroy
    product = Product.find(params[:product_id])
    product.hunter.where(user: current_user).take.try(:destroy)
    redirect_to request.referrer
  end
end

class ProfileController < ApplicationController
  def show
    @profile = User.find(params[:id])
    @profile_products = @profile.products
  end
end

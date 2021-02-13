class CommentsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # redirect_to request.referrer
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    # @comment_id = @comment.id
    @comment.destroy
    # redirect_to request.referrer
  end

  def update
    @comment = @product.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to product_path(@product)
    else
      render "edit"
    end
  end

  def edit
    # @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    # redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end

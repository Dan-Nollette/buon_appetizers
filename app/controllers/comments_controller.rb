class CommentsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "The comment has been updated."
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to products_path(@comment)
    else
      render :new
    end
  end

private
  def comment_params
      params.require(:comment).permit(:text_body, :product_id).merge(current_user)
  end
end

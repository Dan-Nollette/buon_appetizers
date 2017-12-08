class CommentsController < ApplicationController


  def new
    if current_user
      @product = Product.find(params[:product_id])
      @comment = @product.comments.new
    else
      redirect_to new_user_registration_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user && current_user.id == @comment.user_id
      @comment.destroy
    end
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    unless current_user && current_user.id == @comment.user_id
      redirect_to products_path
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = @product.comments.find(params[:id])
    if current_user && current_user.id == @comment.user_id
      if @comment.update(comment_params)
        flash[:notice] = "The comment has been updated."
        redirect_to product_path(@product)
      else
        render :edit
      end
    end
  end

  def create
    if current_user
      @product = Product.find(params[:product_id])
      @comment = @product.comments.new(comment_params)
      if @comment.save
        flash[:notice] = "Comment successfully added!"
        redirect_to products_path(@comment)
      else
        render :new
      end
    else
      redirect_to new_user_registration_path
    end
  end

private
  def comment_params
    params.require(:comment).permit(:text_body, :product_id).merge("user_id" => current_user.id.to_s)
  end
end

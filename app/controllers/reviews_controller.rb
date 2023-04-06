class ReviewsController < ApplicationController
  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_update_params)
      render json: { review: @review }, status: :ok
    else
      render json: { review: @review, errors: { messages: @review.errors.full_messages } }, status: :bad_request
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.save
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @brewery = @review.brewery
    @review.destroy!
    redirect_to brewery_path(@brewery), success: t('.success')
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(brewery_id: params[:brewery_id])
  end

  def review_update_params
    params.require(:review).permit(:content)
  end
end

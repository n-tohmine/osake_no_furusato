class ReviewsController < ApplicationController
  def create
    visit_date_param = params[:review][:visit_date]

    if visit_date_param.blank?
      visit_date = nil
    else
      year = params[:review][:visit_date].split('-')[0].to_i
      month = params[:review][:visit_date].split('-')[1].to_i
      day = 1
      visit_date = Date.new(year, month, day)
    end

    @review = current_user.reviews.build(review_params)
    @review.visit_date = visit_date
    @review.save
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_update_params)
      render json: { review: @review }, status: :ok
    else
      render json: { review: @review, errors: { messages: @review.errors.full_messages } }, status: :bad_request
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @brewery = @review.brewery
    @review.destroy!
    redirect_to brewery_path(@brewery), success: t('defaults.message.deleted', item: 'レビュー')
  end

  private

  def review_params
    params.require(:review).permit(:content, :star, :visit_date).merge(brewery_id: params[:brewery_id])
  end

  def review_update_params
    params.require(:review).permit(:content, :star, :visit_date)
  end
end

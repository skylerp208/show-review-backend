class Api::V1::ReviewsController < ApplicationController
  before_action :find_review, only: [:update]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def create
    @review = Review.new(review_params)
    @review.save
    @shows = Show.all
    render json: @shows
  end


  def update
    @review.update(review_params)
    if @review.save
      render json: @note, status: :accepted
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

    def review_params
      params.permit(:rating, :content, :user_id, :show_id)
    end

    def find_review
        @review = Review.find(params[:id])
    end
end

class Api::V1::ShowsController < ApplicationController
  before_action :find_show, only: [:update]

  def index
    @shows = Show.all
    render json: @shows
  end

  def update
    @show.update(show_params)
    if @show.save
      render json: @note, status: :accepted
    else
      render json: {errors: @show.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

    def show_params
      params.permit(:title, :genre, :image, :description)
    end

    def find_show
        @show = Show.find(params[:id])
    end

end

class Api::V1::NuggetsController < ApplicationController

  def index
    render json: Nugget.all
  end

  def show
    render json: Nugget.find(params[:id])
  end

  def create
    render json: Nugget.create(nugget_params)
  end

  def update
    render json: Nugget.update(nugget_params)
  end

  def destroy
    render json: Nugget.delete(params[:id])
  end

  private

  def nugget_params
    params.require(:nugget).permit(:title, :description, :external_link, :user_id)
  end
end

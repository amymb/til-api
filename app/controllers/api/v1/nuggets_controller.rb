class Api::V1::NuggetsController < ApplicationController

  def index
    render json: Nugget.all
  end
end

class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  # POST /birds
  def create
    bird = Bird.new(bird_params)
    if bird.save
      render json: bird, status: :created
    else
      render json: { errors: bird.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def bird_params
    params.permit(:name, :species)
  end

end
class Api::V1::ScoresController < ApplicationController
  before_action :find_score, only: [:update]

  def index
    @scores = Score.all
    render json: @scores
  end

  def create
    @score = Score.create(score_params)
    render json: @score
  end

  def show
    @score = Score.find(params[:id])
    render json: @score

  def update
    @score.update(score_params)
    if @score.save
      render json: @score, status: :accepted
    else
      render json: { errors: @score.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def score_params
    params.permit(:level_one, :level_two)
  end

  def find_score
    @score = Score.find(params[:id])
  end
end

class HighscoresController < ApplicationController
  def create
  end

  def show
    if params.has_key?(:username)
      @Scores = Score.where(:username => params[:username])
      render json: @Scores[0, 5]
    else
      render json: Score.all[0, 5]
    end
  end

  def new
    @score = Score.new(score_params)

    if @score.save!
      render json: @score
    else
      render json: {
          error: "Could not create score",
          status: 400
      }, status: 400
    end
  end

  private
  def score_params
    params.permit(:score, :username)
  end
end

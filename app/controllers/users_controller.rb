class UsersController < ApplicationController
  def index
    @User = User.all
    render json: @User
  end

  def show
    @User = User.find(params[:id])
    render json: @User
  end

  def create
    render json: { test: "hello" }
  end

  def new
    @User = User.new(article_params)

    if !User.where(:email => params[:email]).blank?
      render json: {
          error: "This email is already registered with an account",
          status: 400
      } and return
    end

    if !User.where(:username => params[:username]).blank?
      render json: {
          error: "This username is in use",
          status: 400
      } and return
    end

    if @User.save
      redirect_to @User
    else
      render json: {
          error: "Could not create user",
          status: 400
      }, status: 400
    end
  end

  private
  def article_params
    params.permit(:username, :password, :email)
  end
end

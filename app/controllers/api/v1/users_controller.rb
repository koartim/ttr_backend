class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update]

    def index
      @users = User.all
      render json: @users
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def create
      @user = User.create(user_params)
      render json: @user
    end


    def update
      @user.update(user_params)
      if @user.save
        render json: @user, status: :accepted
      else
        render json: { errors: @user.errors.full_messages },
        status: :unprocessible_entity
      end
    end

    def create
      @user = User.create!(user_params)
      # render json: @user
      # @user.save
    end

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :user_name)
  end

  def find_user
    @user = User.find(params[:id])
  end

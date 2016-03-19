class Api::V1::UsersController < ApplicationController
  def create
  	@user = User.new(user_params)

  	if @user.save
  		render json: @user, status: :created
  	else
  		render json: @user.errors, status: :unprocessable_entity
  	end
  end

  def index
  	@users = User.all

  	render json: @users
  end

  private

    def user_params
      params.require(:user).permit(:first_name,:last_name, :email)
    end
end

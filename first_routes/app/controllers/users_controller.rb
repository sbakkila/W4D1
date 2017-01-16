class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    render json: User.update(params[:id], user_params)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to index
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

end

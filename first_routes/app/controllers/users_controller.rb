class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    user = User.new(user_attributes)
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
    # debugger

    render json: User.update(params[:id], name: params[:name])
    # redirect_to index
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to index
  end

  private
  def user_attributes
    params.require(:user).permit(:name, :email)
  end

end

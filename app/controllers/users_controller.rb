class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[dashboard settings update destroy]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    # REDIRECT
    if current_user.blank?
      redirect_to root_path
    end

    @user = current_user
  end

  def settings
    # REDIRECT
    if current_user.blank?
      redirect_to root_path
    end

    @user = current_user
  end

  def update
    puts "-----------------------"
    puts user_params
    puts "-----------------------"
    @user = User.find(current_user.id)

    if @user.update!(user_params)
      redirect_back(fallback_location: dashboard_path, success: "Successfully Updated!")
    else
      @user = current_user
      render :settings
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :biography, :image)
    # params.require(:user).permit(:username, :name, :email, :password, :biography, :user_image_id)
  end
end

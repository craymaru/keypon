class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[dashboard settings update destroy]
  before_action :authenticate_owner!, only: %i[update destroy]

  def authenticate_owner!
    return if current_user == User.find(params[:id])
    flash[:danger] = "authenticate_owner!"
    redirect_back(fallback_location: root_path)
  end

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

    if @user.update(user_params)
      redirect_back(fallback_location: dashboard_path, success: "Successfully Updated!")
    else
      flash[:danger] = "Save Error!"
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

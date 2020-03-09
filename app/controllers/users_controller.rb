class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def settings
    if current_user.blank?
      redirect_to root_path
    end
    # もしユーザーがログインしていなければリダイレクト
    @user = current_user
  end

  def update
    puts "-----------------------"
    puts user_params
    puts "-----------------------"
    edit_user = User.find(current_user.id)

    if edit_user.update(user_params)
      redirect_to settings_users_path(), notice: "Update Sucsess!"
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

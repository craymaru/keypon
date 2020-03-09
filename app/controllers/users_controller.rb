class UsersController < ApplicationController
  def index
  end

  def show
  end

  def settings
    # もしユーザーがログインしていなければリダイレクト
    
    @user = current_user
  end
end

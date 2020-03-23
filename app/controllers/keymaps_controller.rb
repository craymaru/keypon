class KeymapsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :authenticate_owner!, only: %i[edit update destroy]

  def authenticate_owner!
    return if current_user == Keymap.find(params[:id]).user
    flash[:danger] = "authenticate_owner!"
    redirect_back(fallback_location: root_path)
  end

  # PV COUNT BY IMPRESSIONIST
  impressionist :actions => %i[show]

  def index
  end

  def search
    keywords = params[:q]
    @q = Keymap.order(params[:sort]).ransack(keywords)
    @q.sorts = "updated_at desc" if @q.sorts.empty?
    @keymaps = @q.result(distinct: true).where(status: "Public")
  end

  def new
    @keymap = Keymap.new
  end

  def show
    @keymap = Keymap.find(params[:id])
    @categorized_keymap = @keymap.commands.group_by { |i| i.category_name }
  end

  def edit
    @keymap = Keymap.find(params[:id])
  end

  def create
    @keymap = current_user.keymaps.new(keymap_params)
    if @keymap.save
      redirect_to keymap_path(@keymap), success: "Successfully Created!"
    else
      flash[:danger] = "Save Error!"
      render :new
    end
  end

  def update
    @keymap = Keymap.find(params[:id])
    if @keymap.update(keymap_params)
      redirect_to keymap_path(@keymap), success: "Successfully Updated!"
    else
      flash[:danger] = "Save Error!"
      render :edit
    end
  end

  def destroy
    @keymap = Keymap.find(params[:id])
    @keymap.destroy
    redirect_to search_keymaps_path
  end

  def favorites
    @keymaps = current_user.favorite_keymaps.includes(:user).recent
  end

  private

  def keymap_params
    params.require(:keymap).permit(:name, :version, :introduction, :status, :tag_list, :content)
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end

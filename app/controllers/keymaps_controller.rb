class KeymapsController < ApplicationController
  def index
  end

  def search
    @keymaps = Keymap.all
    if params[:search].present?
      @keymaps = @keymaps.search(params[:search])
    end
  end

  def new
    @new_keymap = Keymap.new
  end

  def show
    @keymap = Keymap.find(params[:id])
    @categorized_keymap = @keymap.commands.group_by { |i| i.category_name }
  end

  def edit
    @keymap = Keymap.find(params[:id])
  end

  def create
    new_keymap = Keymap.new(keymap_params)
    if new_keymap.save
      redirect_to keymap_path(new_keymap)
    else
      render :new
    end
  end

  def update
    edit_keymap = Keymap.find(params[:id])
    if edit_keymap.update(keymap_params)
      redirect_to keymap_path(edit_keymap), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def keymap_params
    params.require(:keymap).permit(:name, :version, :introduction, :status)
  end
end

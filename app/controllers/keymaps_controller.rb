class KeymapsController < ApplicationController
  def index
  end

  def search
  end

  def new
    @new_keymap = Keymap.new
  end
  

  def show
    @keymap = Keymap.find(params[:id])
  end

  def edit
  end

  def create
    new_keymap = Keymap.new(new_keymap_params)
    if new_keymap.save
      redirect_to keymap_path(new_keymap)
    else
      
    end
  end

  def update
  end

  def destroy
  end


  private

  def new_keymap_params
    params.require(:keymap).permit(:name, :version, :introduction, :status)
  end
end

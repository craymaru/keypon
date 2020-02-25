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
  end

  def update
  end

  def destroy
  end


  private

  def keymap_params
    params.require(:keymap).permit(:item_id, :amount)
  end
end

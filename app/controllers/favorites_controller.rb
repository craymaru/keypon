class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(keymap_id: params[:keymap_id])
    favorite.save!
    redirect_back(fallback_location: root_path)
    # redirect_to keymaps_path, success: t(".flash.favorite")
  end

  def destroy
    current_user.favorites.find_by(keymap_id: params[:keymap_id]).destroy!
    redirect_back(fallback_location: root_path)
    # redirect_to keymaps_path, success: t(".flash.not_favorite")
  end
end

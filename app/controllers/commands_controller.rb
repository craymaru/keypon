class CommandsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update]

  def create
    ActiveRecord::Base.transaction do
      keymap = Keymap.find(params[:keymap_id])
      @command = keymap.commands.new(command_params)
      if @command.save!
        key_bindings = Keybinding.new(command_id: @command.id, name: keybinding_params[:keybinding_name])
        if key_bindings.save!
          flash[:success] = "Command Saved!"
        end
      end
      redirect_to keymap_path(@command.keymap)
    end

    # render status: :ok, json: {}
    # redirect_to keymaps_path
  end

  def update
  end

  def recomend_update
    # STAR
    command = Command.find(params[:id])
    if command.recomend
      command.recomend = false
    else
      command.recomend = true
    end
    if command.save!
      redirect_to keymap_path(command.keymap)
    else
    end
  end

  def destroy
    command = Command.find(params[:id])
    command.destroy
    redirect_back(fallback_location: keymap_path(command.keymap))
  end

  private

  def command_params
    params.require(:command).permit(:category_name, :name, :when)
  end

  def keybinding_params
    params.require(:command).permit(:keybinding_name)
  end
end

class CommandsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      keymap = Keymap.find(1)
      new_command = keymap.commands.new(command_params)
      new_command.save!
      puts "--- DEBUG -------------------"
      puts "keybinding_params[:keybinding_name]:"
      puts keybinding_params[:keybinding_name]
      puts "-----------------------------"
      key_bindings = Keybinding.new(command_id: new_command.id, name: keybinding_params[:keybinding_name])
      key_bindings.save!
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

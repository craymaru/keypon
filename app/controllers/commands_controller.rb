class CommandsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      keymap = Keymap.find(1)
      new_command = keymap.commands.new(command_params)
      new_command.save!
      key_bindings = Keybinding.new(command_id: new_command.id, name: keybinding_params)
      key_bindings.save!
    end

    # render status: :ok, json: {}
    # redirect_to keymaps_path
  end

  def update
  end

  def destroy
  end

  private

  def command_params
    params.require(:command).permit(:category_name, :name, :when)
  end

  def keybinding_params
    params.require(:command).permit(:keybinding_name)
  end
end

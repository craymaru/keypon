class CommandsController < ApplicationController
  def create
    command = Command.new()
    keybind = Keybinding.new()

    if command.save && keybind.save
    else
    end
  end

  def update
  end

  def destroy
  end

  private

  def new_command_params
    params.require(:command).permit(:category, :name, :keybinding, :when)
  end
end

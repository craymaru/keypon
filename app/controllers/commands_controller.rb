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

  def ajax_update
    post_text = params[:data][:text]
    puts "---post_text--------------------------"
    puts post_text
    results = { :message => post_text }
    render partial: "ajax_partial", locals: { :results => results }
    puts "---res--------------------------"
    res = render_to_string partial: "ajax_partial", locals: { :results => results }
    puts res
  end

  def recomend_update
    # STAR
    command = Command.find(params[:id])
    puts "---params--------------------------"
    puts params
    puts "---command.name--------------------------"
    puts command.name
    puts "---command.recomended--------------------------"
    puts command.recomend
    puts "-----------------------------"
    if command.recomend
      command.recomend = false
    else
      command.recomend = true
    end
    puts "-----------------------------"
    puts command.recomend
    puts "-----------------------------"
    if command.save!
      redirect_to keymap_path(command.keymap)
    else
    end
  end

  def destroy
    command = Command.find(params[:id])
  end

  private

  def command_params
    params.require(:command).permit(:category_name, :name, :when)
  end

  def keybinding_params
    params.require(:command).permit(:keybinding_name)
  end
end

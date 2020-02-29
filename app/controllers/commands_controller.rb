class CommandsController < ApplicationController
  def create
    command = Command.new


    current_end_user.cart_items.each do |cart_item|
      decided_order.order_details.build(
        name: cart_item.item.name
      )
    end
    
    if command.save
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

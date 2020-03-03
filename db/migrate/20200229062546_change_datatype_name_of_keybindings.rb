class ChangeDatatypeNameOfKeybindings < ActiveRecord::Migration[6.0]
  def change
    change_column :keybindings, :name, :string
  end
end

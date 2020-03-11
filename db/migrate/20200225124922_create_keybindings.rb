class CreateKeybindings < ActiveRecord::Migration[6.0]
  def change
    create_table :keybindings do |t|
      t.integer :command_id
      t.integer :times
      t.integer :order
      t.integer :name

      t.timestamps
    end
  end
end

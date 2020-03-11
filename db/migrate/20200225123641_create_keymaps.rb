class CreateKeymaps < ActiveRecord::Migration[6.0]
  def change
    create_table :keymaps do |t|
      t.integer :user_id
      t.integer :origin_keymap_id
      t.string :name
      t.string :version
      t.text :introduction
      t.integer :status
      t.datetime :modified_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

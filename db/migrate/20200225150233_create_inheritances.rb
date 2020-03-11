class CreateInheritances < ActiveRecord::Migration[6.0]
  def change
    create_table :inheritances do |t|
      t.integer :inheritable_keymap_id
      t.integer :inheritancer_keymap_id

      t.timestamps
    end
  end
end

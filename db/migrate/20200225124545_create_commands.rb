class CreateCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :commands do |t|
      t.integer :keymap_id
      t.string :category_name
      t.string :name
      t.string :when
      t.boolean :recomend

      t.timestamps
    end
  end
end

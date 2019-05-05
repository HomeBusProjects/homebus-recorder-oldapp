class CreateAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :attributes do |t|
      t.string :attribute, null: false

      t.timestamps
    end
    add_index :attributes, :attribute
  end
end

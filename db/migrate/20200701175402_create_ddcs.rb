class CreateDdcs < ActiveRecord::Migration[5.2]
  def change
    create_table :ddcs do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :ddcs, :name
  end
end

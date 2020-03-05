class DropAttributes < ActiveRecord::Migration[5.2]
  def change
    drop_table :attributes
  end
end

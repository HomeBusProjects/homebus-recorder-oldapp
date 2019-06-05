class ChangeSampleIndexToGin < ActiveRecord::Migration[5.2]
  def change
    remove_index :samples, :data
    add_index :samples, :data, using: :gin
  end
end

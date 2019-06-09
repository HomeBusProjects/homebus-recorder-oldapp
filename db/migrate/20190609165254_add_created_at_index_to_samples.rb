class AddCreatedAtIndexToSamples < ActiveRecord::Migration[5.2]
  def change
    add_index :samples, :created_at
  end
end

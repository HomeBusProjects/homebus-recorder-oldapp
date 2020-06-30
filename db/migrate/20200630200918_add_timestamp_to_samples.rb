class AddTimestampToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :timestamp, :time
    add_index :samples, :timestamp
  end
end

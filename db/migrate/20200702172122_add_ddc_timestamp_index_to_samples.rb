class AddDdcTimestampIndexToSamples < ActiveRecord::Migration[5.2]
  def change
    add_index :samples, [:ddc, :created_at]
  end
end

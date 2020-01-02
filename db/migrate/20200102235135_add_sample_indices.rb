class AddSampleIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :samples, [:created_at, :uuid]
    add_index :samples, [:created_at, :topic]
  end
end

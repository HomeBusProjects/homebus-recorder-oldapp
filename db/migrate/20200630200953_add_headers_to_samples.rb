class AddHeadersToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :headers, :jsonb
    add_index :samples, :headers, using: :gin
  end
end

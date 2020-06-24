class AddDdcAndSequenceToSample < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :ddc, :string
    add_index :samples, :ddc
    add_column :samples, :sequence, :string
    add_index :samples, :sequence
  end
end

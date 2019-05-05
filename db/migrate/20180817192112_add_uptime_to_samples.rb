class AddUptimeToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :uptime, :integer, null: false, default: 0
    add_column :samples, :freeheap, :integer, null: false, default: 0

    add_index :samples, :uptime
    add_index :samples, :freeheap
  end
end

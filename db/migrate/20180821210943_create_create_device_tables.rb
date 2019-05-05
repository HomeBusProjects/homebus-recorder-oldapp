class CreateCreateDeviceTables < ActiveRecord::Migration[5.2]
  def change
    create_table :create_device_tables do |t|
      t.string :nickname
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.float :longitude
      t.float :latitude
      t.string :api_key

      t.timestamps
    end
    add_index :create_device_tables, :nickname
  end
end

class CreateSamples < ActiveRecord::Migration[5.2]
  def change
    create_table :samples do |t|
      t.uuid :uuid
      t.string :topic, null: false
      t.jsonb :data, null: false, default: '{}'

      t.timestamps
    end

    add_index :samples, :uuid
    add_index :samples, :topic
    add_index :samples, :data
  end
end

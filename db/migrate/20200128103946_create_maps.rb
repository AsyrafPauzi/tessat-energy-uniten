class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :tessat_maps do |t|
      t.text :data_id
      t.text :file_name
      t.date :file_date

      t.timestamps
    end
  end
end

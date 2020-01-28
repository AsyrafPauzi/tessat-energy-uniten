class AddFullNameToTessatMap < ActiveRecord::Migration[6.0]
  def change
    add_column :tessat_maps, :full_name, :text
  end
end

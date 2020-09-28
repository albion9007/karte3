class ChangePatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :p_num, :string, null: false
    add_column :patients, :gender, :string, null: false
  end
end

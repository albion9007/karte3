class ChangeObservations2 < ActiveRecord::Migration[6.0]

  def change
    change_column :observations, :temperature, :decimal, precision: 3, scale: 1
    add_column :observations, :time, :string, null: false
    add_column :observations, :hainyou, :string, null: false
    add_column :observations, :user_name, :string, null: false
  end

end

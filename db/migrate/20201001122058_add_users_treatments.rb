class AddUsersTreatments < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :position, :string, null: false
    add_column :treatments, :user_name, :string, null: false
  end
end

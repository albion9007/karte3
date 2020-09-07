class ChangeObservations < ActiveRecord::Migration[6.0]
  def change
    change_column :observations, :excresion_id, :string
    rename_column :observations, :excresion_id, :excresion

    change_column :observations, :ex_amount_id, :string
    rename_column :observations, :ex_amount_id, :ex_amount

    change_column :observations, :atten_sound_id, :string
    rename_column :observations, :atten_sound_id, :atten_sound

    change_column :observations, :lung_sound_id, :string
    rename_column :observations, :lung_sound_id, :atten_part

    change_column :observations, :sputum_id, :string
    rename_column :observations, :sputum_id, :sputum

    change_column :observations, :cough_id, :string
    rename_column :observations, :cough_id, :cough
  end

  def up
    add_column :observations, :user_name, :string, null: false
  end

  def down
    remove_column :observations, :user_name, :string, null: false
  end
end

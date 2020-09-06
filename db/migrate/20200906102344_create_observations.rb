class CreateObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :observations do |t|
      t.decimal  :temperature
      t.integer    :pulse
      t.integer     :respiration
      t.integer     :high_blood_pressure
      t.integer    :low_blood_pressure
      t.integer     :spo2
      t.string     :food_intake
      t.string     :water_intake
      t.integer    :excresion_id
      t.integer    :ex_amount_id
      t.integer    :atten_sound_id
      t.integer    :lung_sound_id
      t.integer    :sputum_id
      t.integer    :cough_id
      t.string     :sleep
      t.references :user, foreign_key: true
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end

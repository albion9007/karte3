class CreatePatientUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_users do |t|
      t.references :patient, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
    t.string "time", null: false
    t.string "test"
    t.string "medicine"
    t.string "injection"
    t.references :patient, foreign_key: true
    t.references :user, foreign_key: true
    t.timestamps
    end
  end
end

class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.integer :p_num,      null: false
      t.string  :name,      null: false
      t.datetime    :birth_date
      t.string     :tel,   default: ""
      t.string     :post_num,   default: ""
      t.integer    :prefecture_id,                null: false
      t.string     :city,        default: ""
      t.string     :house_num,   default: ""
      t.string     :apart_name,  default: ""
      t.string    :key_person,   default: ""
      t.string    :kp_tel,   default: ""
      t.string    :main_disease,   null: false
      t.string    :sub_disease,   default: ""
      t.string    :main_doctor,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

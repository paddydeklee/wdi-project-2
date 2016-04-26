class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :consultation, index: true, foreign_key: true
      t.text :treatment_for
      t.string :treatment_name
      t.string :treatment_type
      t.string :treatment_quantity
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end

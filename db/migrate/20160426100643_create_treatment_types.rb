class CreateTreatmentTypes < ActiveRecord::Migration
  def change
    create_table :treatment_types do |t|
      t.string :name
      t.string :image_path

      t.timestamps null: false
    end
  end
end

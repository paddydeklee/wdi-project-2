class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.string :type_of
      t.text   :brief
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

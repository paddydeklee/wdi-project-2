class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :brief
      t.string :image
      t.string :type_of

      t.timestamps null: false
    end
  end
end

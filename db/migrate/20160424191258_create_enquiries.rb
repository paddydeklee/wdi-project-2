class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.references :user, index: true, foreign_key: true
      t.string :type_of
      t.text :brief
      t.string :image
      t.string :status
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps null: false
    end
  end
end

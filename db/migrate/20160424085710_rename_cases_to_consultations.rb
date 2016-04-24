class RenameCasesToConsultations < ActiveRecord::Migration
  def change
    rename_table :cases, :consultations
  end
end

class AddDoctorIdToTreatment < ActiveRecord::Migration
  def change
    add_reference :treatments, :patient
  end
end

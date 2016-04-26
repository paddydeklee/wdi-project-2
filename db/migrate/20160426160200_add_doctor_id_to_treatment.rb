class AddDoctorIdToTreatment < ActiveRecord::Migration
  def change
    add_reference :treatments, :doctor
  end
end

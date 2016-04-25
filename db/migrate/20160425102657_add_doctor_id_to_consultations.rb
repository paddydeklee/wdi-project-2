class AddDoctorIdToConsultations < ActiveRecord::Migration
  def change
    add_reference :consultations, :doctor
  end
end

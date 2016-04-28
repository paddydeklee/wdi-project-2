class Treatment < ActiveRecord::Base
  belongs_to :consultation
  belongs_to :patient
  has_one :treatment_type

  def accept!
    self.accepted = 1
    self.consultation.status = "Treatment Accepted"
    self.save
  end

end

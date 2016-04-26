class Treatment < ActiveRecord::Base
  belongs_to :consultation
  has_one :treatment_type

end

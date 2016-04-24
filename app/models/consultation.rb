class Consultation < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"

  validates :brief, presence: true, length: { in: 10..300 }
  validates :type_of, presence: true
end

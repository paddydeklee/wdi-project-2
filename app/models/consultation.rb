class Consultation < ActiveRecord::Base
  belongs_to :user

  validates :brief, presence: true, length: { in: 10..140 }
  validates :type_of, presence: true
end

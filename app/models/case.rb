class Case < ActiveRecord::Base
  #relationships
  has_and_belongs_to_many :doctors, class_name: "User"
  has_and_belongs_to_many :patients, class_name: "User"

  #validations
  validates :brief, presence: true, length: { in: 10..140 }
  validates :type_of, presence: true
end

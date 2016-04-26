class Consultation < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"
  has_one    :treatment

  belongs_to :enquiry

  acts_as_commentable

  validates :brief, presence: true, length: { in: 10..300 }
  validates :type_of, presence: true

  before_validation :add_default_status

  def accept!
      self.status = "accepted"
      self.save
  end

  private
      def add_default_status
          self.status = "pending" if self.status.nil?
      end

end

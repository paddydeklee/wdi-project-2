class Enquiry < ActiveRecord::Base
  belongs_to :user
  belongs_to :consultation 

  before_validation :add_default_status

  private
      def add_default_status
          self.status = "pending" if self.status.nil?
      end
end

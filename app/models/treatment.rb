class Treatment < ActiveRecord::Base
  belongs_to :consultation

  before_validation :add_default_accepted

  private
      def add_default_accepted
          self.accepted = False if self.accepted.nil?
      end
end

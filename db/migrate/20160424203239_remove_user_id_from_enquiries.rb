class RemoveUserIdFromEnquiries < ActiveRecord::Migration
  def change
        remove_reference :enquiries, :user
  end
end

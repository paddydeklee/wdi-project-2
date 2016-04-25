class AddUserIdToEnquiries < ActiveRecord::Migration
  def change
    add_reference :enquiries, :user
  end
end

class User < ActiveRecord::Base
  ##QUESTION - SHOULD THESE BE HAS AND BELONGS TO MANY?
  ##QUESTION - SHOULD THE CLASS NAME BE USER or CASE?
  has_many :consultations 
  has_many :consultations_as_doctor, class_name: "Consultation", foreign_key: "doctor_id"
  has_many :consultations_as_patient, class_name: "Consultation", foreign_key: "user_id"


  has_many :treatments_as_doctor, class_name: "Treatment", foreign_key: "doctor_id"
  has_many :treatments_as_patient, class_name: "Treatment", foreign_key: "patient_id"

  has_many :enquiries
  has_many :enquiries_as_sender, foreign_key: "sender_id", class_name: "Enquiry"
  has_many :enquiries_as_receiver, foreign_key: "receiver_id", class_name: "Enquiry"



  # Validations

  validates :role, presence: true
  validates :email, presence: true, uniqueness: true

  
  before_validation :add_default_role

  TEMP_EMAIL_PREFIX = 'change@me'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :identities, dependent: :destroy

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    user = create_user(auth) if user.nil?
  end

  private
    def add_default_role
        self.role = "patient" if self.role.nil?
    end

    def self.create_user(auth)
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified

      # Select a user if they have already registered
      user = User.find_by_email(email) if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          image: auth.info.image || "",
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        # If you use confirmable module 
        # user.skip_confirmation!
        user.save!
      end

      # Associate the identity with the user if needed --DO I NEED THIS?
      if identity.user != user
        identity.user = user
        identity.save!
      end
      
      user
    end


end

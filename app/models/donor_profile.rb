class DonorProfile < ApplicationRecord
  include GenerateSerial
  include SendConfirmationCode

  enum is_verified: {no: 0, yes: 1}
  enum is_available: {no: 0, yes: 1}


  validates :blood_type, presence: true
  belongs_to :user
  belongs_to :blood_type

  after_create :send_verification_code


  def send_verification_code
    verify_code = self.serial
    self.verification_code = verify_code
    self.sendCode(user_params[:mobile],verify_code)

  end
end

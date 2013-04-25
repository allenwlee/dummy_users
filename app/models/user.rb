require 'bcrypt'

class User < ActiveRecord::Base
  before_create :hash_password
  validates :email, uniqueness: true

  def self.authenticate(params)
    matched_user = User.where('email = ?', params[:email]).first



    if BCrypt::Password.create(params[:password]) == matched_user.password
      matched_user
    else
      nil
    end
  end

  private

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end
end

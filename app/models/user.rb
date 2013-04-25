

class User < ActiveRecord::Base
  # Remember to create a migration!

  def self.authenticate(params)
    @matched_user = User.where("email = ? AND password = ?", params[:email], params[:password])
    if @matched_user.length == 1
      @matched_user.first
    else
      nil
    end
  end
end

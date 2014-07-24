class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  class << self
    def find_or_create_from_auth_hash(hash)
      case hash['provider']
      when 'google_oauth2'
        email = hash['info']['email']
        unless (user = User.find_by_email(email))
          user = User.new
          user.email = email
          user.save!
        end

        # always update user info to keep things up-to-date
        user.name = hash['info']['name']
        user.save!

        user
      end
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  has_many :identities, dependent: :destroy
  def self.from_omniauth auth
    user = User.find_or_initialize_by(email: auth['info']['email'])
    user.update_attributes(password: SecureRandom.hex(8), name: auth['info']['name']) unless user.persisted?
    user.identities.find_or_create_by(provider: auth.provider, uid: auth.uid.to_s) if user.persisted?
    return user
  end

end

class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apartments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |person|
      person.provider = auth.provider
      person.uid = auth.uid
      # person.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.person_attributes"]
      new(session["devise.person_attributes"], without_protection: true) do |person|
        person.attributes = params
        person.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :posts

  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token

  def level
    User.experience_to_level(self.experience).floor
  end

  def progress
    User.experience_to_level(self.experience) - self.level
  end

  private

  def self.experience_to_level(experience)
    (experience / 40 + 4.5 ** 2) ** 0.5 - 4.5
  end

  def self.level_to_experience(level)
    40 * level ** 2 + 360 * level
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end

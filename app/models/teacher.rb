class Teacher < ActiveRecord::Base

  attr_accessor :activation_token

  before_create :create_activation_digest

	has_secure_password

  has_many :students

  validates :name, :email, presence: true
  validates_uniqueness_of :email

  def email_authenticated?(token)
    digest = self.activation_digest
    return false if digest.nil?
    Bcrypt::Password.new(digest).is_token?(token)
  end

  def is_token?(token)
    BCrypt::Password.new(self.activation_digest) == token
  end


  private
  def Teacher.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(activation_token)
    BCrypt::Password.create(activation_token)
  end

  def create_activation_digest
    self.activation_token = Teacher.new_token
    self.activation_digest = Teacher.digest(activation_token)
  end
end

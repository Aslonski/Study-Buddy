class Teacher < ActiveRecord::Base

  attr_accessor :activation_token

  before_create :create_activation_digest

	has_secure_password

  has_many :students

  validates :name, :email, presence: true
  validates_uniqueness_of :email

  def email_authenticated?(act_token)
    digest = self.activation_digest
    return false if digest.nil?
    if BCrypt::Password.new(digest) == act_token
      return true
    end
  end

  def new_password(new_password)
    self.password = new_password
    self.save
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

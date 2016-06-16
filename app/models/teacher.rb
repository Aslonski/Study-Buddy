class Teacher < ActiveRecord::Base

  attr_accessor :activation_token

  before_create :create_activation_digest

	has_secure_password

  has_many :students

  validates :name, :email, presence: true
  validates_uniqueness_of :email

  def Teacher.new_token
    SecureRandom.urlsafe_base64
  end

  private
    def create_activation_digest
      self.activation_token = Teacher.new_token
      self.activation_digest = Teacher.digest(activation_token)
    end
end

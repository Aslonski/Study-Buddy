class Teacher < ActiveRecord::Base	
	has_secure_password
	
  has_many :students

  validates :name, :email, presence: true
  validates_uniqueness_of :email

end

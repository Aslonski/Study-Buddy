class Teacher < ActiveRecord::Base
  has_many :students

  validates :name, :email, presence: true
  validates_uniqueness_of :email

end

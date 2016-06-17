class Student < ActiveRecord::Base
  belongs_to :teacher

  validates :first_name, :last_name, :age, :gpa,
   :grade, :disciplinary_strikes, :shirt_size, presence: true

  validates :grade, numericality: {only_integer: true}

  validates :age, numericality: {only_integer: true}

  validates :gpa, inclusion: { in: 0..4 }


  validates :grade, numericality: { :less_than_or_equal_to => 12 }
  validates :grade, numericality: { :greater_than_or_equal_to => 0 }

  validates :gpa, numericality: { :less_than_or_equal_to => 4.0 }
  validates :gpa, numericality: { :greater_than_or_equal_to => 0 }

  validates :age, numericality: {only_integer: true}

  def full_name
    first_name + " " + last_name
  end

  def grade
    self[:grade] == 0 ? "K" : self[:grade].to_s
  end

  def grade=(grade)
    self[:grade] = (grade == "K" ? 0 : grade.to_i)
  end
end

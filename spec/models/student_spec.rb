require 'rails_helper'

# RSpec.describe Student, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe Student do
  it { should belong_to(:teacher) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:gpa) }
  it { should validate_presence_of(:grade) }
  it { should validate_presence_of(:disciplinary_strikes) }
  it { should validate_presence_of(:shirt_size) }

  it { should validate_numericality_of(:age).only_integer }
  it { should validate_numericality_of(:grade).only_integer }
  it { should validate_numericality_of(:grade).is_less_than_or_equal_to(12) }
  it { should validate_numericality_of(:grade).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:gpa).is_less_than_or_equal_to(4.0) }
  it { should validate_numericality_of(:gpa).is_greater_than_or_equal_to(0) }
  it { should validate_inclusion_of(:gpa).in_range(0..4) }

end

require 'rails_helper'

# RSpec.describe Teacher, type: :model do

# end

describe Teacher do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:students) }
end



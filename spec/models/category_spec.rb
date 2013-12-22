require 'spec_helper'

describe Category do

  it { should have_valid(:name).when('Fiction', 'History', 'Children') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should validate_uniqueness_of :name }

end

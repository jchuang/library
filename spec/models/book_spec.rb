require 'spec_helper'

describe Book do

  it { should validate_presence_of :title }

  it { should have_valid(:rating).when(0, 5, 27, 100, nil) }
  it { should_not have_valid(:rating).when(-1, 33.3, 105, 'awesome')}

end

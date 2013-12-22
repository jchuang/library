require 'spec_helper'

describe Checkout do

  it { should validate_presence_of :book }
  it { should validate_presence_of :due_date }

  it { should belong_to :book }

end

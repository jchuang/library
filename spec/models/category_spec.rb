require 'spec_helper'

describe Category do

  it { should have_valid(:name).when('Fiction', 'History', 'Children') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should validate_uniqueness_of :name }

  it { should have_many(:categorizations).dependent(:destroy) }
  it { should have_many(:books).through(:categorizations) }

  it 'should add categories to database' do
    expect(Category.count).to eql(0)
    Category.seed
    expect(Category.count).to be > 0
  end

  it 'should not create duplicate categories' do
    Category.seed
    category_count = Category.count
    Category.seed
    expect(Category.count).to eql(category_count)
  end

end

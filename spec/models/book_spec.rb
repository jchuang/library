require 'spec_helper'

describe Book do

  it { should validate_presence_of :title }

  it { should have_valid(:rating).when(0, 5, 27, 100, nil) }
  it { should_not have_valid(:rating).when(-1, 33.3, 105, 'awesome')}

  it { should have_many(:checkouts).dependent(:destroy) }
  it { should have_many(:categorizations).dependent(:destroy) }
  it { should have_many(:categories).through(:categorizations) }

  it 'should add books to database using seed file' do
    expect(Book.count).to eql(0)
    Book.seed
    expect(Book.count).to be > 0
  end

  it 'should not create duplicate books' do
    Book.seed
    book_count = Book.count
    Book.seed
    expect(Book.count).to eql(book_count)
  end
end

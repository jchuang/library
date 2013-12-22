require 'csv'

class Book < ActiveRecord::Base
  validates_presence_of :title

  validates_numericality_of :rating, only_integer: true,
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100,
    allow_nil: true

  has_many :checkouts, inverse_of: :book, dependent: :destroy

  def self.seed
    filename = Rails.root + 'db/data/books.csv'
    CSV.foreach(filename, headers: true) do |row|
      Book.find_or_create_by(author: row['author'], title: row['title']) do |book|
        book.title = row['title']
        book.author = row['author']
        book.rating = row['rating']
      end
    end
  end
end

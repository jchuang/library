class Checkout < ActiveRecord::Base
  validates_presence_of :book
  validates_presence_of :due_date

  belongs_to :book, inverse_of: :checkouts
end

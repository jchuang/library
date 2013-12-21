class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_numericality_of :rating, only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100, allow_nil: true
end

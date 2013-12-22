class Categorization < ActiveRecord::Base
  belongs_to :book, inverse_of: :categorization
  belongs_to :category, inverse_of: :categorization
end

class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  CATEGORY_NAMES = ['Fiction', 'Mystery', 'Cooking', 'Children', 'Young Adult']

  def self.seed
    CATEGORY_NAMES.each do |category_name|
      unless Category.where(name: category_name).exists?
        Category.create(name: category_name)
      end
    end
  end
end

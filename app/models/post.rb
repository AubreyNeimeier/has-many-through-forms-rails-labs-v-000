class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments


  def categories_attributes=(cats)
    cats.values.each do |cat|
      category = Category.find_or_create_by(cat)
      self.categories << category
    end
  end




end

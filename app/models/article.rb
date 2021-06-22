class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :has_categories
  has_many :categories,through: :has_categories

  #propiedad de lectura y escritura del objeto
  attr_accessor :category_elements

  def save_categories
    #category_elements 1,2,3
    # iterar el arreglo
    # crear registro en HasCategory


    category_elements.each do |category_id|
      HasCategory.find_or_create_by(article: self, category_id: category_id )
    end
  end
end

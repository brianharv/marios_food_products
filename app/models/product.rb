class Product < ApplicationRecord
  has_many :reviews
  validates :name, :cost, :country_of_origin, presence: true
  before_save(:titleize_name)

  private
  def titleize(user_input)
    input_array = []
    user_input = user_input.split(' ')
    user_input.each do |word|
      input_array.push((word.capitalize))
    end
    input_array.join(' ')  
  end  

  def titleize_name
    self.name = self.name.titleize
  end  
end  
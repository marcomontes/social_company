class Category < ActiveRecord::Base

  has_many :messages

  validates :name, presence: true
  validates :name, uniqueness: true

end

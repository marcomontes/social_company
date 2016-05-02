class Group < ActiveRecord::Base

  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :name, uniqueness: true
  
end

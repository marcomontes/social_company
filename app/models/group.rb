class Group < ActiveRecord::Base

  has_and_belongs_to_many :users, join_table: :users_groups

  validates :name, presence: true
  validates :name, uniqueness: true
  
end

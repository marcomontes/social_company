class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  validates :visibility, presence: true
  validates :group_ids, presence: true
  validates :body, presence: true
  
end

class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  validates :visibility, presence: true
  validates :group_ids, presence: true
  validates :body, presence: true

  before_create :clean_groups

  scope :publics,  -> { where(visibility: 1) }
  scope :privates, -> { where(visibility: 2) }
  scope :groups,   -> { where(visibility: 3) }

  delegate :name, to: :user, prefix: true
  delegate :name, to: :category, prefix: true
  
  def self.visibility_options
    { "Público" => 1, "Privado" => 2, "Grupo" => 3 }
  end

  private

    def clean_groups
      self.group_ids = self.group_ids.reject(&:empty?)
    end
end

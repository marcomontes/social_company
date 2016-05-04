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

  def self.for_user_dashboard(user)
    public_messages = self.publics
    private_messages = user.messages.privates
    group_messages = self.user_groups_messages(user)

    (public_messages + private_messages + group_messages).uniq
  end

  def self.user_groups_messages(user)
    user_groups = user.group_ids
    group_messages = []

    self.groups.each do |msg|
      msg.group_ids.each do |group_id|
        group_messages << msg if user_groups.include?(group_id.to_i)
      end
    end

    group_messages
  end

  private

    def clean_groups
      self.group_ids = self.group_ids.reject(&:empty?)
    end
end

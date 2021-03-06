class Keymap < ApplicationRecord

  # RATYRATE
  ratyrate_rateable "star"

  # RichText
  has_rich_text :content

  # acts-as-taggable-on
  acts_as_taggable

  # IMPRESSIONIST
  is_impressionable

  # ASSOCIATIONS
  belongs_to :user
  has_many :commands, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  # has_many :rates, dependent: :destroy
  has_many :inheritances, class_name: "inheritance", foreign_key: "inheritable_keymap_id", dependent: :destroy
  has_many :inheritances, class_name: "inheritance", foreign_key: "inheritancer_keymap_id", dependent: :destroy

  # ENUMS
  enum status: {
    "Public": 0,
    "Private": 1,
    "Draft": 2,
  }

  # INSTANCE-METHODS
  def favorite_by?(user)
      favorites.where(user_id: user.id).exists? if user.present?
  end

  def rating()
    (self.impressionist_count * 1) + (self.favorites.count * 128)
  end

  # RANSACKER FAVORITES
  ransacker :favorites_count do
    query = "(SELECT COUNT(favorites.keymap_id) FROM favorites where favorites.keymap_id = keymaps.id GROUP BY favorites.keymap_id)"
    Arel.sql(query)
  end

  # VALIDATES
  validates :user_id, presence: true
  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 128 }
  validates :version, length: { maximum: 64 }
  validates :introduction, length: { maximum: 1000 }
  validates :status, presence: true
end

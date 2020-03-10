class Keymap < ApplicationRecord
  # acts-as-taggable-on
  acts_as_taggable

  # ASSOCIATIONS
  belongs_to :user
  has_many :commands, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :inheritances, class_name: "inheritance", foreign_key: "inheritable_keymap_id", dependent: :destroy
  has_many :inheritances, class_name: "inheritance", foreign_key: "inheritancer_keymap_id", dependent: :destroy

  # ENUMS
  enum status: {
         "Public": 0,
         "Private": 1,
         "Draft": 2,
       }

  # VALIDATES
  validates :user_id, presence: true
  validates :name,
            presence: true,
            length: { minimum: 2, maximum: 64 }
  validates :version, length: { maximum: 16 }
  validates :introduction, length: { maximum: 500 }
  validates :status, presence: true
end

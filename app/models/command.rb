class Command < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :keymap
  has_many :keybindings, dependent: :destroy

  # VALIDATES
  validates :keymap_id, presence: true
  validates :category_name, length: { maximum: 24 }
  validates :name, length: { maximum: 16 }
  validates :when, length: { maximum: 16 }
end

class Command < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :keymap
  has_many :keybindings, dependent: :destroy

  # VALIDATES
  validates :keymap_id, presence: true
  validates :category_name, length: { maximum: 128 }
  validates :name, length: { maximum: 64 }
  validates :when, length: { maximum: 64 }
end

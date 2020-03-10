class Command < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :keymap
  has_many :keybindings, dependent: :destroy

  # VARIDATES
  varidates :keymap_id, presence: true
  validates :category_name, length: { maximum: 24 }
  varidates :name, length: { maximum: 16 }
  validates :when, length: { maximum: 16 }
end

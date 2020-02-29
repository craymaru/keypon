class Command < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :keymap
  has_many :keybindings
end

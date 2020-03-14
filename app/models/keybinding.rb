class Keybinding < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :command

  # VALIDATES
  validates :command_id, presence: true
  validates :name,
            presence: true,
            length: { minimum: 1, maximum: 64 }
  validates :times, length: { maximum: 4 }
  validates :order, length: { maximum: 4 }
end

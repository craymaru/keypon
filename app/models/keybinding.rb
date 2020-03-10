class Keybinding < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :command

  # VARIDATES
  varidates :command_id, presence: true
  varidates :name,
            presence: true,
            length: { minimum: 1, maximum: 16 }
  validates :times, length: { maximum: 4 }
  validates :order, length: { maximum: 4 }
end

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :keymap

  # VALIDATES
  validates :user_id, uniqueness: { scope: :keymap_id }
end

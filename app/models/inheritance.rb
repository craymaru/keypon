class Inheritance < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :keymap

  # VALIDATES
  validates :inheritable_keymap_id, presence: true
  validates :inheritancer_keymap_id, presence: true
end

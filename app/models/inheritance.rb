class Inheritance < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :keymap

  # VARIDATES
  varidates :inheritable_keymap_id, presence: true
  varidates :inheritancer_keymap_id, presence: true

end

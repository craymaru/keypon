class Keymap < ApplicationRecord
  # ASSOCIATIONS
  # belongs_to :user
  has_many :commands
  has_many :inheritances
  has_many :favorites
  has_many :rates
  has_many :inheritances, class_name: "inheritance", foreign_key: "inheritable_keymap_id"
  has_many :inheritances, class_name: "inheritance", foreign_key: "inheritancer_keymap_id"
end

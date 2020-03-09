class User < ApplicationRecord
  # IMAGE UPLOADER
  include ImageUploader[:image]

  # ASSOCIATIONS
  has_many :keymaps
  has_many :favorites
  has_many :rates

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

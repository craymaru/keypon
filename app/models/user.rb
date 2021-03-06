class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # IMAGE UPLOADER
  include ImageUploader[:image]

  # ASSOCIATIONS
  has_many :keymaps
  has_many :favorites, dependent: :destroy
  has_many :favorite_keymaps, through: :favorites, source: :keymap
  # has_many :rates, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # RATYRATE
  ratyrate_rater

  # VALIDATES
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :username,
            presence: true,
            format: { with: /\A[a-z0-9]+\z/, message: "Only alphanumeric characters." },
            uniqueness: { case_sensitive: :false },
            length: { minimum: 4, maximum: 24 }
  validates :name, length: { maximum: 24 }
  validates :biography, length: { maximum: 500 }
end

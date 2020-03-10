class User < ApplicationRecord
  before_save { self.email = email.downcase }

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

  # VARIDATES
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :username,
            presence: true,
            format: { with: /\A[a-z0-9]+\z/, message: "Only alphanumeric characters." },
            uniqueness: { case_sensitive: :false },
            length: { minimum: 4, maximum: 24 }
  validates :name, length: { minimum: 1, maximum: 24 }
  validates :biography, length: { maximum: 500 }
end

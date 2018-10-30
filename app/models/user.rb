class User < ApplicationRecord
  after_initialize :init

  def init
    self.role ||= :standard
  end

  validates :name, length: {minimum:1, maximum:100}, presence: true
  validates :password, presence: true, length: {minimum: 6}, if: -> {"password_digest.nil?"}
  validates :password, length: {minimum:6}, allow_blank: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:3, maximum:254}

  has_secure_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :registerable, :confirmable

  has_many :wikis, dependent: :destroy

  enum role: [:standard, :premium, :admin]
end

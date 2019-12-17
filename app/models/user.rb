class User < ApplicationRecord
  # Includrmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments, dependent: :destroy

  before_validation :set_name, on: :create

  validates :name, presence: true, length: {maximum: 35}

  private

  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end
end

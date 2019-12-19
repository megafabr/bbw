class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  # В 5-х Рельсах эти валидации не нужно явно прописывать
  validates :event, presence: true
  validates :user, presence: true

  # Добавляем uploader, чтобы заработал carrierwave
  mount_uploader :photo, PhotoUploader
end

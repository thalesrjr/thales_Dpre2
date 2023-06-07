class Company < ApplicationRecord
  belongs_to :user
  has_many :positions # atualizado
  has_one_attached :logo
  validates :name, :url, presence: true
end

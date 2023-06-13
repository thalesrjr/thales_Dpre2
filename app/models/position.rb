class Position < ApplicationRecord
  belongs_to :company
  has_many :applicants

  before_save :set_slug
  enum career: [:developer, :business_inteligence, :information_technology,
    :design, :product, :technology, :other]
  enum contract: [:clt, :pj, :match]

  validates :name, :career, :contract, :city, :state, :summary, presence: true

  private

  def set_slug

    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}"
  end
end

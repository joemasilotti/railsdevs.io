class Specialty < ApplicationRecord
  include PgSearch::Model

  has_many :specialty_tags
  has_many :developers, through: :specialty_tags, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  pg_search_scope :containing, against: :name, using: {tsearch: {prefix: true}}

  scope :visible, -> { order("LOWER(name)") }

  before_validation :normalize_name

  private

  def normalize_name
    self.name = name&.strip
  end
end

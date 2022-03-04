class Developer < ApplicationRecord
  include Availability
  include Avatarable
  include HasSocialProfiles

  enum search_status: {
    actively_looking: 1,
    open: 2,
    not_interested: 3,
    invisible: 4
  }

  belongs_to :user
  has_many :conversations, -> { visible }
  has_one :location, dependent: :destroy, autosave: true
  has_one :role_level, dependent: :destroy, autosave: true
  has_one :role_type, dependent: :destroy, autosave: true
  has_one_attached :cover_image

  has_noticed_notifications

  accepts_nested_attributes_for :location, reject_if: :all_blank, update_only: true
  accepts_nested_attributes_for :role_level, update_only: true
  accepts_nested_attributes_for :role_type, update_only: true

  validates :bio, presence: true
  validates :cover_image, content_type: ["image/png", "image/jpeg", "image/jpg"], max_file_size: 10.megabytes
  validates :hero, presence: true
  validates :location, presence: true, on: :create
  validates :cover_image, content_type: ["image/png", "image/jpeg", "image/jpg"],
  max_file_size: 10.megabytes

  scope :filter_by_utc_offset, ->(utc_offset) do
    joins(:location).where(locations: {utc_offset:})
  end

  validates :name, presence: true

  scope :filter_by_role_types, ->(role_types) do
    RoleType::TYPES.filter_map { |type|
      where(role_type: {type => true}) if role_types.include?(type)
    }.reduce(:or).joins(:role_type)
  end

  scope :visible, -> { where(search_status: [:open, :actively_looking, :not_interested, nil]) }

  scope :filter_by_utc_offset, ->(utc_offset) do
    joins(:location).where(locations: {utc_offset:})
  end

  scope :available, -> { where(available_on: ..Time.current.to_date) }
  scope :available_first, -> { where.not(available_on: nil).order(:available_on) }
  scope :newest_first, -> { order(created_at: :desc) }

  after_create_commit :send_admin_notification

  def visible?
    search_status == "visible" || search_status == "actively_looking" || search_status == "not_interested" || search_status == "open" || search_status.nil?
  end

  def location
    super || build_location
  end

  def role_level
    super || build_role_level
  end

  def role_type
    super || build_role_type
  end

  # If a check is added make sure to add a NewDeveloperFieldComponent to the developer form.
  def missing_fields?
    search_status.blank? ||
      location.missing_fields? ||
      role_level.missing_fields? ||
      role_type.missing_fields? ||
      available_on.blank?
  end

  private

  def send_admin_notification
    NewDeveloperProfileNotification.with(developer: self).deliver_later(User.admin)
  end
end

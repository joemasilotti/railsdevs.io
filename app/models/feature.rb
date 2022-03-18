class Feature
  def self.enabled?(feature_name:, user: nil)
    case feature_name.to_sym
    when :new_developer_fields_banner
      true
    when :pricing_v2
      true
    when :role_level_filters
      !Rails.env.production? || user&.admin?
    end
  end
end

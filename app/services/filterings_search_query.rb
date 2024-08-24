class FilteringsSearchQuery
  include HasScope

  has_scope :by_id
  has_scope :by_week, type: :boolean
  has_scope :by_month, type: :boolean
  has_scope :by_day, using: [:date]
  has_scope :by_current, type: :boolean
  has_scope :by_personalized, type: :hash

  ALLOWED_SCOPES = [:by_id, :by_week, :by_month, :by_day, :by_current, :by_personalized].freeze

  def perform(collection, params = {})
    used_scopes = params.keys.map(&:to_sym) & ALLOWED_SCOPES
    raise ArgumentError, 'At least one valid scope must be provided' if used_scopes.empty?

    apply_scopes(collection, params)
  end
end

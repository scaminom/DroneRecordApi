class FilteringsSearchQuery
  include HasScope

  has_scope :by_id, as: 'drone_id'
  has_scope :by_week, type: :boolean
  has_scope :by_month, type: :boolean
  has_scope :by_day, using: [:date]
  has_scope :by_current, type: :boolean
  has_scope :by_personalized, using: %i[start_date end_date], type: :hash

  def perform(collection, params = {})
    if params.empty?
      collection.all
    else
      apply_scopes(collection, params)
    end
  end
end


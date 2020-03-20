class Consumer < ApplicationRecord
  scope :search, ->(search_term) { where("name ILIKE :wc OR postal_code LIKE :pf OR city LIKE :wc", wc: "%#{search_term}%", pf: "#{search_term}%")}
end

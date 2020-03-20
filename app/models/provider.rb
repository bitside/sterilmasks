class Provider < ApplicationRecord
  before_create -> { self.confirmation_token = SecureRandom.urlsafe_base64.to_s }
  after_create -> { UserMailer.with(provider: self).provider_confirmation_email.deliver_later }

  scope :search, ->(search_term) { where("name ILIKE :wc OR postal_code LIKE :pf OR city LIKE :wc", wc: "%#{search_term}%", pf: "#{search_term}%")}
  
  validates :name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :postal_code, numericality: true
  validates :city, presence: true
end

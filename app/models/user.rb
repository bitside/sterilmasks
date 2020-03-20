class User < ApplicationRecord
  before_create -> { self.confirmation_token = SecureRandom.urlsafe_base64.to_s }
  after_create -> { UserMailer.with(user: self).confirmation_email.deliver_later }

  scope :search, ->(search_term) { where("name ILIKE :wc OR postal_code LIKE :pf OR city LIKE :wc", wc: "%#{search_term}%", pf: "#{search_term}%")}
  scope :confirmed, -> { where("confirmed_at IS NOT NULL") }

  validates :name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :postal_code, numericality: true
  validates :city, presence: true

  def try_confirm(given_token)
    given_token = given_token || ""
    expected_token = self.confirmation_token || ""

    if ActiveSupport::SecurityUtils.secure_compare(given_token, expected_token)
      confirm
    else
      false
    end
  end

  def confirm
    self.confirmed_at = Time.now
    self.save
  end
end

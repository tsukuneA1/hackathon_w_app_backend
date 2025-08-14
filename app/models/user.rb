class User < ApplicationRecord
  before_validation :normalize_fields

  validates :provider, presence: true
  validates :uid,      presence: true, uniqueness: { scope: :provider }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  validates :email,
           allow_nil: true,
           length: { maximum: 255 },
           format: { with: URI::MailTo::EMAIL_REGEXP, message: "の形式が正しくありません" }

  validates :avatar_url,
           allow_blank: true,
           format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                     message: "は http/https のURLを指定してください" }

  private

  def normalize_fields
    self.provider   = provider.to_s.strip.downcase.presence || "github"
    self.uid        = uid.to_s.strip
    self.username   = username.to_s.strip.downcase
    self.email      = email.to_s.strip.downcase.presence
    self.avatar_url = avatar_url.to_s.strip.presence
  end
end

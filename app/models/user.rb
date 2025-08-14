class User < ApplicationRecord
  before_validation :normalize_fields

  validates :provider, presence: { message: "必須項目です" }
  validates :uid,      presence: true, uniqueness: { scope: :provider, message: "すでに登録されています" }
  validates :username, presence: true, uniqueness: { case_sensitive: false, message: "すでに使用されています" }

  validates :email,
            allow_nil: true,
            length: { maximum: 255, message: "メールアドレスが長すぎます" },
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "正しいメールアドレスを入力してください" }

  validates :avatar_url,
            allow_blank: true,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                      message: "正しいURLを入力してください" }

  private

  def normalize_fields
    self.provider   = normalize(provider, default: "github")
    self.uid        = normalize(uid)
    self.username   = normalize(username)
    self.email      = normalize(email)
    self.avatar_url = normalize(avatar_url)
  end

  def normalize(value, default: nil)
    value.to_s.strip.downcase.presence || default
  end
end

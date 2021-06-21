class User < ApplicationRecord
  after_initialize :ensure_session_token
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end

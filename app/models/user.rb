class User < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  before_save   :downcase_email
  before_create :generate_access_token

  validates_presence_of :first_name, :last_name, :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  has_one :questionaire

  has_many :questionaire_takers, through: :taker_matches, source: :questionaire_taker
  has_many :taker_matches, foreign_key: :questionaire_maker_id, class_name: "Match"

  has_many :questionaire_makers, through: :maker_matches, source: :questionaire_maker
  has_many :maker_matches, foreign_key: :questionaire_taker_id, class_name: "Match"

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    def generate_access_token
      begin
        self.access_token = User.new_token
      end while self.class.exists?(access_token: access_token)
    end

end

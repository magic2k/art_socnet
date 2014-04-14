class User < ActiveRecord::Base
  before_save :ensure_authentication_token
  # Include default devise modules. Others available are:
  # :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #, :token_authenticatable

  has_attached_file :avatar, styles: {small: '300x300>', large: '600x600>',
                                      thumb: ['100x100>', :png]}, default_url: 'std_avatar.jpg'
  has_one :restaurant, dependent: :destroy
  has_one :showman_type, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :conversations, foreign_key: 'sender_id', dependent: :destroy
  has_many :recipients, through: :conversations, source: :receiver
  # has_many :recipients, through: :messages, source: :receiver

  #serialize :languages, Array
  #has_secure_password
  validates :email, presence: true, uniqueness: true
  #validates :password, presence: true
  #validates :password_confirmation, presence: true
  #validates :password_digest, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end

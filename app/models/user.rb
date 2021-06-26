class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname,               presence: true
  validates :encrypted_password,     presence: true, length: { minimum: 6 }
  validates :family_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :family_name_kana,       presence: true,format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_kana,        presence: true,format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :birth_date,             presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, length: { minimum: 6 },
               confirmation: true do
    validates :password
  end

  with_options presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '@を含めて入力してください' },
               uniqueness: { case_sensitive: false } do
    validates :email
  end
end

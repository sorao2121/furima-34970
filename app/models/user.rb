class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname,               presence: true
  validates :encrypted_password,     presence: true
  validates :family_name,            presence: true
  validates :family_name_kana,       presence: true
  validates :first_name,             presence: true
  validates :first_name_kana,        presence: true
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

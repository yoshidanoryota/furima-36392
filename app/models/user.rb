class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, :first_name, :last_name, :first_name_kana,
            :last_name_kana, :birthday,  presence: true

  validates :encrypted_password,:password ,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}

  validates :first_name_kana, :last_name_kana, format: {
             with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,}

  validates :first_name, :last_name, format: {
             with: /\A[ぁ-んァ-ン一-龥]/}
end

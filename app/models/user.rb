class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :user_name,:birthday
      with_options format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/} do
        validates :encrypted_password,:password
      end
      with_options format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,} do
        validates :first_name_kana, :last_name_kana
      end
      with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
        validates :first_name, :last_name
      end
  end
  
end
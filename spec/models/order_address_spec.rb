require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it '情報が全て存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'building_name以外の情報が全て存在すれば購入できる' do
        @order_address.building_name = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと購入できない' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeにハイフンがないと購入できない' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it 'zip_codeが全角だと購入できない' do
        @order_address.zip_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it 'zip_codeが英字だと購入できない' do
        @order_address.zip_code = 'abc-defg'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it 'zip_codeが英数字混合だと購入できない' do
        @order_address.zip_code = '123-abcd'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it 'zip_codeが6桁以下だと購入できない' do
        @order_address.zip_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it 'zip_codeが8桁以上だと購入できない' do  # バリデーションで8桁以上は入力できないように設定済
        @order_address.zip_code = '123-45678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end

      it 'area_idが[1]だと購入できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phoneが空だと購入できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが全角だと購入できない' do
        @order_address.phone = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが9桁以下だと購入できない' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが12桁以上だと購入できない' do # バリデーションで12桁以上は入力できないように設定済
        @order_address.phone = '123456789100'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが英字だと購入できない' do
        @order_address.phone = 'abcdefghij'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが英数字混合だと購入できない' do
        @order_address.phone = '12345abcde'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneにハイフンがあると購入できない' do
        @order_address.phone = '000-000-0000' # バリデーションで12桁以上は入力できないように設定済
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

# bundle exec rspec spec/models/order_address_spec.rb

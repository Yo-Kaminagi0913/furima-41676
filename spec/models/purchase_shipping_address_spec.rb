require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  describe '購入情報の保存' do
    
    context '内容に問題がない場合' do
      it 'クレジットカードと発送先住所のすべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping_address.postal_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)') # rubocop:disable Layout/LineLength
      end
      it 'postal_codeが全角の数字だと保存できないこと' do
        @purchase_shipping_address.postal_code = '１２３-４５６７'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)') # rubocop:disable Layout/LineLength
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase_shipping_address.prefecture_id = '1'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_shipping_address.address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank",
                                                                           'Phone number is invalid. Input only number')
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_shipping_address.phone_number = '０９０１２３４５６７８'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberに小数が含まれていると保存できないこと' do
        @purchase_shipping_address.phone_number = '090123456.7'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが9文字以下だと保存できないこと' do
        @purchase_shipping_address.phone_number = '090123456'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが12文字以上だと保存できないこと' do
        @purchase_shipping_address.phone_number = '090123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

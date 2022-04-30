require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '商品出品機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@article).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '画像を1枚つけないと保存できないこと' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleがないと保存できないこと' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      it 'textがないと保存できないこと' do
        @article.text = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceがないと保存できないこと' do
        @article.price = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Price can't be blank")
      end
      it 'userが存在しなければ登録できないこと' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('User must exist')
      end
    end
  end
end

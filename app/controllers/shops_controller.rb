class ShopsController < ApplicationController
  # 今まで投稿された店の名前を全部見れる
  def index
    @shoplist = Shop.all

  end

  #new.html.erbのためなので何も書かない
  def new
    
  end

# 投稿した店をshopテーブルに追加する
  def create
    # フォームから送信されたデータを受け取り、保存する処理を追加してください
    @shop = Shop.new(japanese_name: params[:content])
    @shop.save
    redirect_to("/shops")
  end
end


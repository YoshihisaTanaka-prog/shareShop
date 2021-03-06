class ShopsController < ApplicationController
  before_action :is_admin # （application_controller.rbに必要なコードを書いているので）この一行を追加するとこのコントローラーは管理者しかアクセスできなくなります。

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
    #params[:content]で飛ばす前のページ（new.html.erb)のname="content"と対応する
    @shop = Shop.new(japanese_name: params[:japanese_content] , english_name: params[:english_content])
    @shop.save
    redirect_to("/shops")
  end

  def edit
    #投稿の編集をして同一paramsに戻す
    @shop = Shop.find_by(id: params[:id])  
  end

  def update
    @shop = Shop.find_by(id: params[:id])
    @shop.japanese_name = params[:japanese_name]
    @shop.english_name = params[:english_name]
    @shop.save
    redirect_to("/categories")
  end


end


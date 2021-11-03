class CategoriesController < ApplicationController
    before_action :is_admin # （application_controller.rbに必要なコードを書いているので）この一行を追加するとこのコントローラーは管理者しかアクセスできなくなります。

    # 今まで投稿された店の名前を全部見れる
  def index
    @foodlist = Category.all
  end

  def edit

  end

  def show
    @food = Category.find_by(id: params[:id])
  end

  #new.html.erbのためなので何も書かない
  def new
  end

# 投稿した店をfoodテーブルに追加する
  def create
    # フォームから送信されたデータを受け取り、保存する処理を追加してください
    #params[:content]で飛ばす前のページ（new.html.erb)のname="content"と対応する
    @food = Category.new(japanese_name: params[:japanese_content] , english_name: params[:english_content])

    @food.save

    redirect_to("/categories")
  end
end

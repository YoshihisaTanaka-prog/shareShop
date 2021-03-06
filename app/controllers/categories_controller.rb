class CategoriesController < ApplicationController
    before_action :is_admin # （application_controller.rbに必要なコードを書いているので）この一行を追加するとこのコントローラーは管理者しかアクセスできなくなります。

    # 今まで投稿された店の名前を全部見れる
  def index
    if params[:id] == nil
      # カテゴリーが選ばれていないとき、is_topカラムがtrueの物を取得する
      @categories = Category.where(is_top: true)
    else
      # 選ばれたカテゴリーの子どものカテゴリーを取得する。
      @categories = Category.where(parent_id: params[:id])
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])

  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.japanese_name = params[:japanese_name]
    @category.english_name = params[:english_name]
    @category.save
    redirect_to("/categories")
  end

  #new.html.erbのためなので何も書かない
  def new
  end

# 投稿した店をfoodテーブルに追加する
  def create
    # フォームから送信されたデータを受け取り、保存する処理を追加してください
    #params[:content]で飛ばす前のページ（new.html.erb)のname="content"と対応する
    @category = Category.new(japanese_name: params[:japanese_content] , english_name: params[:english_content])
    if params[:parent_id].blank? #parent_idが送られてない時
      @category.is_top = true
      @category.parent_id = 0
    else
      @category.is_top = false
      @category.parent_id =params[:parent_id]
    end

    @category.save

    redirect_to("/categories")
  end
end

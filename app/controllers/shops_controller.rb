class ShopsController < ApplicationController
  def index
    @shoplist = ["ion","gyoumusuper","trial"] 

  end
  def new

  end
  def create
    # フォームから送信されたデータを受け取り、保存する処理を追加してください
    @shops = Shop.new(japanese_name: params[:content])
    @shops.save
    redirect_to("/shops")
  end
end


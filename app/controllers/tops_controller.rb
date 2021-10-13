class TopsController < ApplicationController

    # トップページ用のアクション
    def index
        # サインインしているかどうかで処理を分ける必要があるのかは不明
        if user_signed_in?
            # 各言語に対応させる。
            case @language
            when 'Japanese'
                @page_name = "jpIndexSignedIn"
            when 'English' 
                @page_name = "engIndexSignedIn"
            when 'Chinese'
                @page_name = "chinaIndexSignedIn"
            end
        else
            # 各言語に対応させる。
            case @language
            when 'Japanese'
                @page_name = "jpIndexSignedOut"
            when 'English' 
                @page_name = "engIndexSignedOut"
            when 'Chinese'
                @page_name = "chinaIndexSignedOut"
            end
        end
    end

    # 言語選択用のアクション
    def set_language
        # まず、送られてきた言語の情報が適切なものかどうか判定する。
        if ['Japanese','English','Chinese'].include?(params[:language])
            # 送られてきた言語の情報が適切なとき
            if user_signed_in?
                # ユーザーがサインインしている場合
                # ユーザーテーブルに保存されている言語を更新
                current_user.language = params[:language]
                current_user.save
            else
                # ユーザーがサインインしていない場合
                # 言語のセッションを更新
                session[:language] = params[:language]
            end
            # 元のページに戻る
            redirect_to request.referrer || root_url
        else
            # 送られてきた言語の情報が不適切なとき
            redirect_to root_path
        end
    end
end

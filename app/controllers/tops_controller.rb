class TopsController < ApplicationController

    def index
        if user_signed_in?
            @page_name = "IndexSignedIn"
            # 各言語に対応させる。
            @page_name = params[:lang] + @page_name
        else
            if params[:lang].blank?
                @page_name = "jpIndexSignedOut"
            else
                @page_name = params[:lang] + "IndexSignedOut"
            end
        end
    end

    def set_language
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
    end
end

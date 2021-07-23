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
end

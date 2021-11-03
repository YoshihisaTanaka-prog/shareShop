class ApplicationController < ActionController::Base
    # アクションが実行される前に行う処理
    before_action :def_at_language

    # @languageを定義するためのメソッド
    def def_at_language
        if user_signed_in?
            # ユーザーがサインインしている場合
            # そのユーザーの設定している言語を反映
            @language = current_user.language
        elsif session[:language]
            # サインインしていない場合
            # 言語のセッションが埋められている場合
            # 言語のセッションに保存されている言語を反映
            @language = session[:language]
        else
            # サインインしていない場合
            # 言語のセッションが埋められていない場合
            # デフォルトの日本語を反映させ、言語のセッションに「日本語」という情報を保存
            session[:language] = 'Japanese'
            @language = 'Japanese'
        end
        # ヘッダーに書く内容を決定
        case @language
        when 'Japanese'
            @setting_option = [['設定', '#'], ['店', shops_path], ['カテゴリー', categories_path]]
            @language_option = [['言語・Language', '#'], ['English', language_path(:language => 'English')]]
            @header_file_name = 'layouts/headerJp'
        when 'English'
            @setting_option = [['Setting', '#'], ['shops', shops_path], ['categories', categories_path]]
            @language_option = [['Language・言語', '#'], ['日本語', language_path(:language => 'Japanese')]]
            @header_file_name = 'layouts/headerEng'
        end
    end

    def is_admin
        if user_signed_in?
            if !current_user.admin
                redirect_to request.referrer || root_url
            end
        else
            redirect_to request.referrer || root_url
        end
    end

    # devise用のカラムを追加するために必要
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        # サインインする時に「name」、「room」、「language」カラムをいじることを許可
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :room, :language])
        # ユーザー情報を編集する時に「name」、「room」カラムをいじることを許可
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :room])
    end

end

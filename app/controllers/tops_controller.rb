class TopsController < ApplicationController

    def index
        if user_signed_in?
            @page_name = "signedIn"
        else
            @page_name = "signedOut"
        end
    end
end

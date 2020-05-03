class SearchesController < ApplicationController
    def search 
        if params[:search].blank?
            redirect_to root_path
        else
            @results = Post.joins(:user).search(params[:search])
        end
    end
end

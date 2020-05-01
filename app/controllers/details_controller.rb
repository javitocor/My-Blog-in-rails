class DetailsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_detail, only: [:edit, :update] 

    def new 
    end

    def create 
        @user = User.find
        @detail = @user.detail.create(details_params)
    end

    def edit 
    end

    def update 
        @detail = @user.detail.update(details_params)
    end

    private

    def details_params
        params.require(:details).permit(:birthdate, :nationality, :definition, :employee, :income)
    end

    def set_detail
        @detail = Detail.find(params[:id])
    end
end

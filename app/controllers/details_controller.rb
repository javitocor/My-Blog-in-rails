class DetailsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]

    def new 
        @user = current_user
        @detail = Detail.new(user_id: @user.id)
        @user.detail = @detail
    end

    def create
        @detail = Detail.create(details_params)
    end

    def edit
        @user = current_user
        if @user.detail.nil?
            @detail = Detail.create(user_id: @user.id)
        else
            @detail = Detail.find_by_user_id(params[:id])
        end        
    end

    def update
        @detail = Detail.find(params[:id])
        @detail.update(details_params)
        redirect_to current_user
    end

    private

    def details_params
        params.require(:detail).permit(:nationality, :definition, :employee, :income, :birthdate)
    end

    def set_detail
        @detail = Detail.find(params[:user_id])
    end
end

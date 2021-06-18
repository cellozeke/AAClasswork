class CatsController < ApplicationController
    def index
        @cats = Cat.all
        #render json: @cats
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def new
      @cat = Cat.new
      render :new
    end
end

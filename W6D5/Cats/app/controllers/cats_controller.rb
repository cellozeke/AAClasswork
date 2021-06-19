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

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
        # redirect_to cat_url(@cat.id)
        # redirect_to "localhost:3000/cats/#{@cat.id}"
        redirect_to cat_url(@cat)
        else
        # render json: @cat.errors.full_messages, status: 422
        render :new
        end
    end

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end

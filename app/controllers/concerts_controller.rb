class ConcertsController < ApplicationController
    before_action :set_concert, only: [:show, :edit, :update, :destroy]

    def index
        @concerts = Concert.all
    end

    def new
        @groups = Group.all
        @concert = Concert.new
    end

    def create
        @concert = Concert.new(concert_params)
        respond_to do |format|
            if @concert.save
              format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
              format.json { render :show, status: :created, location: @concert }
            else
              format.html { render :new }
              format.json { render json: @concert.errors, status: :unprocessable_entity }
            end
        end
    end

    def show

    end

    def edit
        @groups = Group.all
    end

    def update
        respond_to do |format|
            if @concert.update(concert_params)
              format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
              format.json { render :show, status: :ok, location: @concert }
            else
              format.html { render :edit, status: :unprocessable_entity  }
              format.json { render json: @concert.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @concert.destroy
        respond_to do |format|
          format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private

    def concert_params
        params.require(:concert).permit(:concert_date, :place, :attendance, :duration, :group_id)
    end

    def set_concert
        @concert = Concert.find(params[:id])
    end

end

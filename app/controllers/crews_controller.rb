class CrewsController < ApplicationController
    before_action :set_crew, only: [:show, :edit, :update, :destroy]    

    def index
        @crews = crew.all
    end


    def show

    end

    def new
        @crew = Crew.new

    end

    def create
        @crew = Crew.new(crew_params)

        respond_to do |format|
          if @crew.save
            format.html { redirect_to @crew, notice: 'Crew was successfully created.' }
            format.json { render :show, status: :created, location: @crew }
          else
            format.html { render :new }
            format.json { render json: @crew.errors, status: :unprocessable_entity }
          end
        end
    end

    def show

    end

    def edit
        
    end

    def update
        respond_to do |format|
          if @crew.update(crew_params)
            format.html { redirect_to @crew, notice: 'Crew was successfully updated.' }
            format.json { render :show, status: :ok, location: @crew }
          else
            format.html { render :edit }
            format.json { render json: @crew.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @crew.destroy
        respond_to do |format|
          format.html { redirect_to crews_url, notice: 'Crew was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private 

    def set_crew
        @crew = Crew.find(params[:id])
    end

    def crew_params
        params.require(:crew).permit(:crew_name, :group_id)
    end
end
class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy]    

    def index
      @groups = Group.all
    end


    def show

    end

    def new
      @group = Group.new
      @group_types = Group.group_types.keys.to_a
      @group.crews.build
    end

    def create
        @group = Group.new(group_params)

        respond_to do |format|
          if @group.save
            format.html { redirect_to @group, notice: 'Group was successfully created.' }
            format.json { render :show, status: :created, location: @group }
          else
            format.html { render :new }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
        end
    end

    def show

    end

    def edit
        @group_types = Group.group_types.keys.to_a
    end

    def update
        respond_to do |format|
          if @group.update(group_params)
            format.html { redirect_to @group, notice: 'Group was successfully updated.' }
            format.json { render :show, status: :ok, location: @group }
          else
            format.html { render :edit }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @group.destroy
        respond_to do |format|
          format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private 

    def set_group
        @group = Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:group_name, :members, :debut_dates, :group_type, crews_attributes: [:crew_name, :group_id])
    end
end

class GroupsController < ApplicationController

  expose(:group, attributes: :group_params)
  expose(:groups)
  expose(:categories)
  

  # GET /groups
  # GET /groups.json
  def index
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    respond_to do |format|
      if group.save
        format.html { redirect_to group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: group }
      else
        format.html { render :new }
        format.json { render json: group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      binding.pry
      if group.update(group_params)
        format.html { redirect_to group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: group }
      else
        format.html { render :edit }
        format.json { render json: group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :category_id)
    end
end

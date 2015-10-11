class MachinesController < ApplicationController
  before_action :set_project
  before_action :set_machine, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @machines = @project.machines.order(:name).page params[:page]
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @machine = Machine.new
  end

  # GET /machine/1/edit
  def edit
  end

  # POST /machine
  # POST /machine.json
  def create
    @machine = Machine.new(machine_params)
    @machine.project = @project
    respond_to do |format|
      if @machine.save
        format.html { redirect_to project_machines_path(@project), notice: 'machine was successfully created.' }
        format.json { render :show, status: :created, location: @machine }
      else
        format.html { render :new }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machine/1
  # PATCH/PUT /machine/1.json
  def update
    respond_to do |format|
      if @machine.update(machine_params)
        format.html { redirect_to project_machines_path(@project), notice: 'machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine }
      else
        format.html { render :edit }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Machines/1
  # DELETE /Machines/1.json
  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url, notice: 'machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.where(url: params[:project_id]).first
    end

    def set_machine
      @machine = @project.machines.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_params
      params.require(:machine).permit(:name, :lat, :lng, :status)
    end

end

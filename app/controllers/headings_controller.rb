class HeadingsController < ApplicationController
  before_action :set_project
  before_action :set_heading, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @headings = @project.headings.order(:name).page params[:page]
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @heading = Heading.new
  end

  # GET /heading/1/edit
  def edit
  end

  # POST /heading
  # POST /heading.json
  def create
    @heading = Heading.new(heading_params)
    @heading.project = @project
    respond_to do |format|
      if @heading.save
        format.html { redirect_to @heading, notice: 'Heading was successfully created.' }
        format.json { render :show, status: :created, location: @heading }
      else
        format.html { render :new }
        format.json { render json: @heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heading/1
  # PATCH/PUT /heading/1.json
  def update
    respond_to do |format|
      if @heading.update(heading_params)
        format.html { redirect_to @heading, notice: 'Heading was successfully updated.' }
        format.json { render :show, status: :ok, location: @heading }
      else
        format.html { render :edit }
        format.json { render json: @heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headings/1
  # DELETE /headings/1.json
  def destroy
    @heading.destroy
    respond_to do |format|
      format.html { redirect_to headings_url, notice: 'Heading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.where(url: params[:project_id]).first
    end

    def set_heading
      @project.headings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heading_params
      params.require(:project).permit(:name, :lat, :lng, :status)
    end

end

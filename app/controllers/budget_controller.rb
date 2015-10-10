class BudgetController < ApplicationController

  before_action :set_project

  def index

  end

  def edit

  end

  def update

  end

  private

    def set_project
      @project = Project.where(url: params[:project_id]).first
    end

end

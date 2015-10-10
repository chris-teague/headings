class ProgressController < ApplicationController

  before_action :set_project

  def view

  end

  private

    def set_project
      @project = Project.where(url: params[:project_id]).first
    end

end

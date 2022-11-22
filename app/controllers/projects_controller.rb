class ProjectsController < ApplicationController
  # before_action :project_params
  before_action :authenticate_user!
  before_action :current_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show

  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)

    redirect_to root_path 
  end

  def edit

  end

  def update
    @project.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy

    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id, :description) 
  end

  def current_project
    @project = Project.find(params[:id])
  end
end

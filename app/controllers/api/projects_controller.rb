class Api::ProjectsController < ApplicationController

  #GET /projects
  def index
    @projects = Project.order('display_order DESC')
  end

  #POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render :show, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /tasks/1
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      render :show, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end

  end

  private

    def project_params
      params.fetch(:project, {}).permit(:name, :display_order)
    end

end
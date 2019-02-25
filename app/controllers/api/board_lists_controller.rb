class Api::BoardListsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @board_lists = BoardList.where(project_id: params[:project_id])
  end

  def use_before_action?
    true
  end

end
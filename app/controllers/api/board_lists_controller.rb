class Api::BoardListsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @project = Project.find(params[:project_id])
    @board_lists = BoardList.where(project_id: params[:project_id])
  end

  # POST
  def create
    board_lists = BoardList.desc_display_order
    last_display_order = board_lists.map(&:display_order)

    @board_list = BoardList.new(name: params[:board_list][:name],
                                project_id: params[:board_list][:project_id],
                                display_order: last_display_order.first + 1,
                                user_id: session[:user_id]
                                )

    if @board_list.save
      render :show, status: :created
    else
      render json: @board_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT
  def update
    @board_list = BoardList.find(params[:id])
    if @board_list.update(board_list_params)
      render :show, status: :ok
    else
      render json: @board_list.errors, status: :unprocessable_entity
    end
  end

  def board_list_params
    params.fetch(:board_list, {}).permit(
        :name
    )
  end

  def use_before_action?
    true
  end

end
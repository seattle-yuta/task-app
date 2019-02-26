class Api::CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  # POST
  def create
    cards = Card.desc_display_order
    last_display_order = cards.map(&:display_order)

    @card = Card.new(name: params[:card][:name],
                                board_list_id: params[:card][:board_list],
                                display_order: last_display_order.first + 1,
                                user_id: session[:user_id]
    )

    if @card.save
      render :show, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT
  def update
    @card = Card.find(params[:id])
    if @card.update(board_list_params)
      render :show, status: :ok
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def board_list_params
    params.fetch(:card, {}).permit(
        :name
    )
  end

  def use_before_action?
    true
  end

end
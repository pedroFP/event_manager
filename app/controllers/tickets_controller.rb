class TicketsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tickets = current_user.tickets.includes(:events)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
  end
end

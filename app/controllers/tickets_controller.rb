class TicketsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  def index
    @tickets = current_user.tickets.includes(:event)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new
    @ticket.user = current_user
    @ticket.event = Event.find(params[:event_id])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to events_path, notice: 'Ticket comprado!' }
        format.json { render json: @resource }
      else
        format.html {redirect_to events_path, alert: 'Error, no se pudo comprar el ticket'}
      end
    end

  end
end

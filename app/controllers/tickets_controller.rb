class TicketsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  def index
    if current_user.admin?
      @tickets = Ticket.where(event_id: params[:event_id])
    else
      @tickets = current_user.tickets.includes(:event)
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      if params[:format] == 'pdf'
        format.pdf {render template: 'tickets/ticket', pdf: 'Ticket'}
      else
        format.html
      end
    end
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

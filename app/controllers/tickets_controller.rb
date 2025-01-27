class TicketsController < ApplicationController
  include Pagy::Backend

  # Display all tickets with pagination
  def index
  
    @pagy, @tickets = pagy(Ticket.order(created_at: :desc), items: 5)
    
  end

  # Render a new ticket form with pagination (optional)
  def new
    @ticket = Ticket.new
    @pagy, @tickets = pagy(Ticket.order(created_at: :desc), items: 5)
  end

  # Show details of a specific ticket
  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @pagy, @tickets = pagy(Ticket.order(created_at: :desc), items: 5)
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket updated successfully."
      redirect_to tickets_path
    else
      flash[:alert] = "There was an error updating the ticket."
      render :edit, status: :unprocessable_entity
    end
  end

  # Create a new ticket
  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket Created successfully."
      redirect_to tickets_path
    else
      render :new
    end
    
  end
  
  def timer_down
    @ticket = Ticket.find(params[:id])
    @pagy, @tickets = pagy(Ticket.order(created_at: :desc), items: 5)
  end
  
  
  


  private

  # Strong parameter method for ticket creation
  def ticket_params
    params.require(:ticket).permit(:ticket_type, :summary, :details, :hours, :notes)
  end
end

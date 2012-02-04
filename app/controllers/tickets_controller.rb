class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket])

    if @ticket.save
      flash[:notice] = "The ticket has been created"
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "The ticket has not been created"
      render :action => "new"
    end
  end

  def show

  end

  def edit

  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "The ticket has been updated"
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "The ticket has not been updated"
      render :action => :edit
    end
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end

class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end
  

  
  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "Object successfully created"
      redirect_to @event
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  



end

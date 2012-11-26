class PollsController < ApplicationController

  # Splash page w/ link to create a new poll
  def index
  end
  
  # given a mgr_link, show the poll, and it's current resuls
  def show
    @poll = Poll.find_by_mgr_link!(params[:id])
  end
  
  # create a new poll form
  def new
    @poll = Poll.new
  end
  
  # create a new poll based on form data
  def create
    @poll = Poll.create(params[:poll])
    if @poll.valid?
      redirect_to @poll
    else
      render action: :new
    end
  end
  
  # edit an existing poll form
  def edit
    @poll = Poll.find_by_mgr_link!(params[:id])
  end
  
  # update an existing poll based on form data
  def update
    @poll = Poll.find_by_mgr_link!(params[:id])
    if @poll.update_attributes(params[:poll])
      redirect_to @poll
    else
      render action: :edit
    end
  end
  
  # delete a poll
  def destroy
    @poll = Poll.find_by_mgr_link!(params[:id])
    @poll.destroy
    redirect_to root_path
  end

end
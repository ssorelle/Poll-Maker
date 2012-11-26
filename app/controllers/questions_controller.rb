class QuestionsController < ApplicationController
  
  before_filter :find_poll
  
  def show
    @question = @poll.questions.find(params[:id])
  end
  
  def new
    @question = @poll.questions.build
  end
  
  def create
    @question = @poll.questions.create(params[:question])
    if @question.valid?
      redirect_to @poll
    else
      render action: :new
    end
  end
  
  def edit
    @question = @poll.questions.find(params[:id])
  end
  
  def update
    @question = @poll.questions.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to @poll
    else
      render action: :edit
    end
  end
  
  def destroy
    @question = @poll.questions.find(params[:id])
    @question.destroy
    redirect_to @poll
  end

  protected
  
  def find_poll
    @poll = Poll.find_by_mgr_link!(params[:poll_id])
  end

end

class Question < ActiveRecord::Base
  
  validates_presence_of :question
  validates_uniqueness_of :question, :scope => :poll_id
  
  belongs_to :poll
  
  attr_accessible :question
  
end
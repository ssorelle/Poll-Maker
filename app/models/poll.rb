class Poll < ActiveRecord::Base
  
  validates_presence_of :name, :link, :mgr_link
  validates_uniqueness_of :link, :mgr_link

  attr_accessible :name, :email
  
  has_many :questions
  
  before_validation do |record|
    record.link     = generate_unique_url if record.link.blank?
    record.mgr_link = generate_unique_url if record.mgr_link.blank?
  end
  
  def to_param
    mgr_link
  end
  
  protected
  
  def generate_unique_url
    Digest::SHA1.hexdigest(self.to_s + Time.now.inspect + rand(36**10).to_s)
  end
  
end
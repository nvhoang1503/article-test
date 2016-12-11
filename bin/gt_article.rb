require_relative "gt_text.rb"
require_relative "gt_photo.rb"

class GtArticle 
  attr_accessor :title, :content, :like_number, :status, :created_at, :updated_at, :activated_at, :posted_at

  def initialize(title, content)
    @title        = title
    @content      = content
    @like_number  = 0                   # the default value is 0
    @status       = STATUS[:in_active]  # the default value is 0 (in_active)
    @created_at   = DateTime.now()      # Created time of the article
    @updated_at   = DateTime.now()      # latest update of the article
    @activated_at = nil                 # latest active of the article
    @posted_at    = nil                 # the time when the article has been posted
  end

  # reset updated at value whenever updating the article 
  def reset_updated_at
    @updated_at = DateTime.now() 
  end

  STATUS = {
    in_active: 0, # the article is not acitve ( is not showing ) in the media site
    active: 1     # the article is already active in the media site
  }

  # return status info of the article
  def status
    if @status == STATUS[:in_active] 
      "In Active"
    else
      "Active"
    end
  end

  # Mark the article active
  def mark_active
    @status       = STATUS[:active]
    @activated_at = DateTime.now()
    reset_updated_at
  end

  # Mark the article in_active
  def mark_in_active
    @status       = STATUS[:in_active]
    reset_updated_at
  end

  #check article is already active (show) on the media site or not
  def is_active
    @status == STATUS[:active]
  end 

  # post the article
  def post
    @posted_at = DateTime.now() # set time when the artcile has been posted
  end 

  # Check the article has already posted (done) or not
  def is_posted
    if @posted_at
      @posted_at < DateTime.now() 
    else
      false
    end
  end

  # increment the like number
  def like
    @like_number = @like_number + 1
    reset_updated_at
  end

  #Update the article with input params
  def update(params = {})
    @title        = params[:title]          if params[:title]
    @like_number  = params[:like_number]    if params[:like_number]
    @status       = params[:status]         if params[:status]
    @content      = params[:content]        if params[:content]
    @activated_at = params[:activated_at]   if params[:activated_at]
    @posted_at    = params[:posted_at]      if params[:posted_at]

    reset_updated_at
  end
  
  def display

    puts "============================ Article Content =========================="
    puts GtCommon.upcase(@title)
    puts "------------------------------------------------------------------------"
    puts @content.display
    puts "========================================================================\n\n\n"
  end

  def info
    puts "============================= Article Info ============================="
    puts "Created at: #{@created_at}"
    puts "Last updated at: #{@updated_at}"
    puts "Liked: #{@like_number}"
    puts "Status: #{self.status}"
    puts "Is Posted: #{self.is_posted}"
    puts "========================================================================\n\n\n"
  end

end
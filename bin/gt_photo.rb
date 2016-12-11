require 'catpix'
require_relative 'basic_info.rb'
class GtPhoto < BasicInfo
  attr_accessor :url

  def initialize(params = {})
    headline      = params[:headline] 
    position      = params[:position]
    like_number   = params[:like_number] 
    url           = params[:url]

    super(headline, position, like_number)
    @url  = url
  end

  def update(params = {})
    @headline      = params[:headline]    if params[:headline]
    @position      = params[:position]    if params[:position]
    @like_number   = params[:like_number] if params[:like_number]
    @url           = params[:url]         if params[:url]
  end

  # Print the photo in basic environemnt ( console )
  def print
    Catpix::print_image self.url,
      :limit_x => 0.2,
      :limit_y => 0,
      :center_x => false,
      :center_y => false,
      :bg => "white",
      :bg_fill => false  
  end

  # Display information of the article image
  def display
    self.print
    puts "#{@headline} -- (Liked: #{@like_number})"
  end

end
require_relative 'basic_info.rb'
require_relative 'gt_common.rb'

class GtText < BasicInfo
  attr_accessor :sentence

  def initialize(params = {})
    headline      = params[:headline] 
    position      = params[:position]
    like_number   = params[:like_number] 
    sentence      = params[:sentence] 

    super(headline, position, like_number)
    @sentence  = sentence
  end

  def update(params = {})
    @headline       = params[:headline]     if params[:headline]
    @position       = params[:position]     if params[:position]
    @like_number    = params[:like_number]  if params[:like_number]
    @sentence       = params[:sentence]     if params[:sentence]
  end

  # Display information of the article image
  def display
    puts "#{GtCommon.capitalize(@headline)} -- (Liked: #{@like_number}) \n\n"
    puts @sentence 
  end




end

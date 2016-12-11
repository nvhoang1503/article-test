class BasicInfo

  attr_accessor :headline, :position, :like_number
  
  def initialize(headline, position, like_number)
    @headline     = headline 
    @position     = position || 0     # default is 0
    @like_number  = like_number || 0
  end

  # increment the like number
  def like
    @like_number = @like_number + 1
  end

end
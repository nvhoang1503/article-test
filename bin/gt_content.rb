
class GtContent
  attr_accessor :text, :photo

  def initialize(text, photo)
    @text   = text
    @photo  = photo
  end

  def update(params = {})
    @text   = params[:text]   if params[:text]
    @photo  = params[:photo]  if params[:photo]
  end

  def display
    if @text.position < @photo.position
      @text.display
      @photo.display
    else
      @photo.display
      @text.display
    end
  end

end
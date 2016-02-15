require 'sinatra/base'
require 'giphy'

class GifGenerator < Sinatra::Base
  set :static, true

  configure :production, :development do
    enable :logging
  end

  get '/' do
    haml :gif
  end

  get '/gif' do
    query = params[:gif]

    begin
      gif = Giphy.random(query)
      @image_url = gif.image_url.to_s
      haml :image
    rescue TypeError
      haml :gif
    end
  end
end

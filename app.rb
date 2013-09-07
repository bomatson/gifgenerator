require 'sinatra/base'
require 'faraday'
require 'json'

class GifGenerator < Sinatra::Base
conn = Faraday.new(url: 'http://api.giphy.com') do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Faraday::Adapter::NetHttp
end
  get '/' do
    haml :form
  end

  post '/form' do
    @query = params[:gif]
    response = conn.get "/v1/gifs/search?q=#{@query}&api_key=dc6zaTOxFJmzC"
    body = JSON.parse(response.body)
    @gifs = body['data']
    image_urls = @gifs.map do |gif|
      gif['images']['original']['url']
    end
    @image_url = image_urls.sample
    haml :image
  end
end
require './config/environment'
require './app/models/model'

class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
  end

  get '/index' do
    return erb :index
  end

  post '/results' do
    answers = params.values
    @total = 0
    answers.each do |answer|
      @total += answer.to_i
    end
    puts @total

    @combo = fortune_generator(@total)
    if @combo == "bear"
      erb :bear
    elsif @combo == "newton"
      erb :newton
    elsif @combo == "muppet"
      erb :muppet
    else:
      erb :fairyGodMother
    end
  end
end

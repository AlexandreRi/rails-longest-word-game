require 'json'
require 'open-uri'
class GamesController < ApplicationController

  def new
    @range = ('A'..'Z').to_a
    @letters = @range.sample(9)
  end

  def score
    input = params[:input]
    url = "https://wagon-dictionary.herokuapp.com/#{input}"
    input = JSON.parse(open(url).read)
    @found = input["found"]
    if (@found == true) && (@letters.include?(params[:input]) == false)
      @answer = "Sorry but #{input} can't be built out of #{@range}"
    elsif @found == false
      @answer = "Sorry but #{input} does not seem to be a valid English word.."
    else
      @answer = "Congratulations! #{input} is a valid English word!"
    end
  end

end

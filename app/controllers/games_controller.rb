require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @guess = params[:guess].downcase
    @option_letters = params[:token].downcase

    if !@guess.chars.all? { |letter| @guess.chars.count(letter) == @option_letters.count(letter) }
      @result = "Sorry, but #{@guess} can't be built out of #{option_letters}"
    elsif JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@guess.capitalize!}").read)["found"] != true
      @result = "Sorry, but #{@guess} does not seem to be a valid English word."
    else
      @result = "Congratulations! #{@guess} is a valid English word!"
    end
  end
end

# @guess.chars.all? { |letter| @option_letters.include?(letter) }

#   def real_word
#     url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
#     api_response = open(url).read
#     parsed_response = JSON.parse(api_response)

#     puts "#{parsed_response['found']}"
#   end

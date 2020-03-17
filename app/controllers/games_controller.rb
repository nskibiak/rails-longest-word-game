class GamesController < ApplicationController
  def new
    @vowels = %w[a e i o u]
    @consonants = ('a'..'z').to_a - @vowels
    @letters = (@consonants.sample(5) + @vowels.sample(4)).shuffle
  end

  def score
    @guess = params[:guess].downcase
    @option_letters = params[:token].downcase.gsub(/[^a-z]/, '').split('')
    @valid_word = check_word(@guess, @option_letters)
    @english_word = check_dictionary(@guess)
    @score = session[:score]
    adjust_score(@valid_word, @english_word)
  end

  def check_word(guess, letters)
    true if guess.chars.all? do |letter|
      guess.chars.count(letter) == letters.count(letter)
    end
  end

  def check_dictionary(guess)
    require 'json'
    # require 'open-uri'
    require 'rest_client'
    request_url = "https://wagon-dictionary.herokuapp.com/#{guess}"
    response = RestClient.get(request_url)
    # response = open(request_url).read
    result = JSON.parse(response)
    result['found']
  end

  def adjust_score(valid_word, english_word)
    session[:score] = 0 if session[:score].nil?
    session[:score] += 1 if valid_word && english_word
  end

  def clear
    session[:score] = nil
    redirect_to new_path
    # the two lines below are an alternative to redirect:
    # @letters = ('A'..'Z').to_a.sample(10)
    # render :new
  end
end

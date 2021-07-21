class PagesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # url = 'https://random-word-api.herokuapp.com/word?number=1'
    # word_serialized = URI.open(url).read
    # word = JSON.parse(word_serialized)[0]

    # url2 = "https://api.datamuse.com/words?rel_nry=#{word}"
    # thing = URI.open(url).read
    # ahh = JSON.parse(thing)

    raise
  end
end

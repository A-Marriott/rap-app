class PagesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @rand_word = Word.all.sample.name.capitalize
    rhyming_word_url = "https://rhymebrain.com/talk?function=getRhymes&word=#{@rand_word}"
    rhyming_words_array = JSON.parse(URI.open(rhyming_word_url).read)[0...100]
    @rhyming_words = rhyming_words_array.map {|rhyme_hash| rhyme_hash["word"].capitalize }

    search_string = 'freestyle_instrumental'

    case params["q"]
    when 'boombap'
      search_string = 'boombap_instrumental'
    when 'trap'
      search_string = 'trap_instrumental'
    when 'drill'
      search_string = 'drill_instrumental'
    when 'lofi'
      search_string = 'lofi_instrumental'
    when 'grime'
      search_string = 'grime_instrumental'
    when 'jazz_rap'
      search_string = 'jazz_rap_instrumental'
    end

    youtube_video_search_url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=#{search_string}&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"

    video_ids = JSON.parse(URI.open(youtube_video_search_url).read)["items"].map do |item|
      item["id"]["videoId"]
    end

    @random_video_id = video_ids.sample

# http://localhost:3000/posts/?query=M3
    # raise
  end
end

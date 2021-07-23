class PagesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @rand_word = Word.all.sample.name.capitalize
    url = "https://rhymebrain.com/talk?function=getRhymes&word=#{@rand_word}"
    rhyming_words_array = JSON.parse(URI.open(url).read)[0...100]
    @rhyming_words = rhyming_words_array.map {|rhyme_hash| rhyme_hash["word"].capitalize }

    url2 = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=boombap_freestyle&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"

    video_ids = JSON.parse(URI.open(url2).read)["items"].map do |item|
      item["id"]["videoId"]
    end

    @random_video_id = video_ids.sample

    # raise
  end
end

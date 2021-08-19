require 'open-uri'
require 'nokogiri'

def init_words
  Word.destroy_all

  words = File.open("db/words.txt").read.split
  words.each do |word|
    if word.length > 2
      Word.create(name: word)
    end
  end
end

def init_youtube_ids
  YoutubeVideo.destroy_all

  boombap_url = ['boombap', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=boombap_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]
  trap_url = ['trap', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=trap_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]
  drill_url = ['drill', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=drill_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]
  lofi_url = ['lofi', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=lofi_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]
  grime_url = ['grime', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=grime_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]
  jazz_rap_url = ['jazz_rap', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=jazz_rap_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]
  freestyle_url = ['freestyle', "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=freestyle_instrumental&maxResults=50&type=video&videoDuration=short&key=#{ENV['YOUTUBE_API_KEY']}"]

  url_array = [boombap_url, trap_url, drill_url, lofi_url, grime_url, jazz_rap_url, freestyle_url]

  url_array.each do |url|
    JSON.parse(URI.open(url[1]).read)["items"].each do |item|
      YoutubeVideo.create(video_id: item["id"]["videoId"], genre: url[0])
    end
  end
end

def init_creative_writing_prompts
  url = "https://stereostickman.com/100-songwriting-prompts-to-get-you-in-the-zone/"
  html = Nokogiri::HTML(URI.open(url).read)
  html.search('div[class=entry-content] ol li').each do |list|
    CreativePrompt.create(prompt: list.text)
  end
end


# Comment functions out as needed

# init_words
# init_youtube_ids
# init_creative_writing_prompts

class CreateYoutubeVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :youtube_videos do |t|
      t.string :video_id
      t.string :genre

      t.timestamps
    end
  end
end

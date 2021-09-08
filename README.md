This app serves as the backend to [rap-app-frontend](https://github.com/A-Marriott/rap-app-frontend). Using an API, rap-app serves a list of YouTube videos from various genres of instrumental hip-hop (seeded from YouTube's API), a list of 1000 most common words, and 100 creative prompts.

To run the app, make sure rails is installed. You will need a youtube API key in order to scrape a list of video IDs, which you can create following [this link](https://developers.google.com/youtube/v3/getting-started).

Once you have your API key, you will need to create a .env file in the root project folder, and save the key in the .env file in the format of YOUTUBE_API_KEY=your_api_key

Ensure that the method calls inside the db/seeds.rb file are uncommented.

Now from inside the project file, run the following commands:
```
bundle install
yarn install
rails db:create db:migrate db:seed
rails s
```
The server should now be up on running on localhost:3000, and making calls to /api/v1/youtube_videos should render a JSON of video ids.
Once this works, head over to [rap-app-frontend](https://github.com/A-Marriott/rap-app-frontend) to start the react server.

This app serves as the backend to rap-app-frontend. Using an API, rap-app serves a list of YouTube videos from various genres of instrumental hip-hop (seeded from YouTube's API), a list of 1000 most common words, and 100 creative prompts.

To run the app, make sure rails is installed. When inside the project file, run the following commands
```
bundle install
yarn install
rails db:create db:migrate db:seed (make sure the function calls inside the db/seeds.rb file are uncommented)
rails s
```
The server should now be up on running on localhost:3000, and making calls to /api/v1/youtube_videos should render a JSON of video ids.
If this works, head over to [rap-app-frontend](https://github.com/A-Marriott/rap-app-frontend) to start the react server

# [Groovester](http://groove-with-me.herokuapp.com/)
## What is Groovester?
Groovester utilizes the Spotify API and user input to quickly generate a playlist of music by various artists. As an avid music listener and music festival attendee, I wanted to create a small application that can help me quickly create a playlist of songs by various artists. This app is especially helpful when I am attending a festival and want an easy way to familiarize myself with songs by unfamiliar artists.

![alt tag](https://user-images.githubusercontent.com/14388583/28288438-061fe8cc-6af4-11e7-89a5-b5f8d7c68c69.png)

## Running Locally
Make sure you have Ruby installed.
Clone or download the repository.

Run the following code to install the application's dependencies:
```
bundle install
```
Create initial database:
```
rake db:create
```
Run the migration:
```
rake db:migrate
```

The application should now be running on your localhost.

## Deployment
To deploy on Heroku. Adjust the APP_NAME to your project name.
```
heroku create APP_NAME
```
Now push it up to Heroku with the following command:
```
git push heroku master
```
It should take a few moments to run, and when it finishes it should say "Launching..." along with a URL.

To easily see you heroku url you can type:
```
heroku apps:info
```
The application can now be found at the URL returned.







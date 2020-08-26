### Weekly
Weekly is an app for sharing and discovering content recommendations.

It's built with Sinatra -- a lightweight alternative to other Ruby frameworks, like Rails -- as well as simple HTML and CSS.

It authenticates users and allows them to perform CRUD operations; they can create, update, and delete their own recommendations, in addition to browsing other users' recommendations.

Sinatra handles the user interaction and renders what appears in-browser. ActiveRecord maps the objects to database table rows and is responsible for all database (SQLite) queries.

I also used [this API](https://rapidapi.com/logicione/api/url-expander1) to validate any links shared.

To run it, just follow the steps below:
1. Fork and then clone this repository.
2. CD into your newly cloned directory.
3. Run `bundle install` to install all necessary gems and their appropriate versions.
4. Run `shotgun` to start up a local server, using the [Shotgun gem](https://rubygems.org/gems/shotgun).
5. Visit `localhost:9393` in your browser.
6. Either create an account or use the test credentials below, and you're in :)

Username: `eleetyson`  
Password: `pw`

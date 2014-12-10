Book app example(backbonejs with sinatra)
===================

heroku deployment
-----------------

### prepare

    heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
    heroku addons:add heroku-postgresql

### go!

    git push heroku master

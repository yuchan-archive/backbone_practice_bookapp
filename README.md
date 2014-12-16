Book app example(backbonejs with sinatra)
===================

[![Build Status](https://travis-ci.org/yuchan-edu/backbone_practice_bookapp.svg?branch=master)](https://travis-ci.org/yuchan-edu/backbone_practice_bookapp)
[![Code Climate](https://codeclimate.com/github/yuchan-edu/backbone_practice_bookapp/badges/gpa.svg)](https://codeclimate.com/github/yuchan-edu/backbone_practice_bookapp)
[![Coverage Status](https://img.shields.io/coveralls/yuchan-edu/backbone_practice_bookapp.svg)](https://coveralls.io/r/yuchan-edu/backbone_practice_bookapp)

dogfooding [this](https://github.com/yuchan/sinatra-boilerplate).

heroku deployment
-----------------

### prepare

    heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
    heroku addons:add heroku-postgresql

### go!

    git push heroku master

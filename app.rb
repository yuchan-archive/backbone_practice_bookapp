require 'bundler'
Bundler.require

include Sprockets::Helpers

class Books < ActiveRecord::Base
  serialize :keywords
end

class Api < Grape::API
  format :json
  prefix :api
  
  get "/books" do
    @books = Books.all
    @books.to_json
  end
  
  get "/books/:id" do
    @book = Books.find(params[:id])
    @book.to_json
  end

  post "/books" do
    @book = Books.new(:title => params[:title],
                      :author => params[:author],
                      :releasedate => params[:releasedate],
                      :keywords => params[:keywords])
    @book.save
  end
  
  put "/books" do
    @book = Books.find(params[:id])
    @book.save
  end
  
  delete "/books/:id" do
    @book = Books.find(params[:id])
    @book.delete
  end
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :sprockets, Sprockets::Environment.new(root)
  get '/' do
    haml :index
  end
end

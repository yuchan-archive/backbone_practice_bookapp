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
    @books
  end
  
  get "/books/:id" do
<<<<<<< HEAD
    begin
      @book = Books.find params[:id]
    rescue ActiveRecord::RecordNotFound => e
      @book = {error: "no books was found."}
    end
=======
    @book = Books.find(params[:id])
>>>>>>> 4f54726... complete tutorial.
    @book
  end

  post "/books" do
    ary = Array.new
    m = params[:keywords]
    m.each{|k|
      k.each{|j,v|
        ary.push(v)
      }
    }
    
    @book = Books.new(:title => params[:title],
                      :author => params[:author],
                      :releasedate => params[:releasedate],
                      :keywords => ary)
    @book.save
    @book
  end
  
  put "/books/:id" do
    @book = Books.find(params[:id])
    @book.update(:title => params[:title],
                 :author => params[:author],
                 :releasedate => params[:releasedate],
                 :keywords => params[:keywords])
    @book
  end
  
  delete "/books/:id" do
    @book = Books.find(params[:id])
    @book.destroy
    {id: params[:id]}
  end
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :sprockets, Sprockets::Environment.new(root)
  get '/' do
    haml :index
  end
end

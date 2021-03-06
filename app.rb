#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:crafter.db"

class Article < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

get '/' do
	@articles = Article.order "created_at DESC"
	
	erb :index			
end

get '/newpost' do
	erb :newpost
end

post '/newpost' do
	add = Article.new params[:article]
	add.save

	redirect to '/'
end

get '/details/:xid' do
	@article = Article.find(params[:xid])

	@comments = Comment.order "created_at"

	erb :details
end

post '/details/:xid' do
	@article = Article.find(params[:xid])

	add = Comment.new params[:comment]
	add.save
	
	redirect to "/details/#{@article.id}"	
end
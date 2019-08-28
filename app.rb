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

before do
end

configure do
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
	erb :details
end

post '/details/:article_id' do
	# article_id = params[:article_id]
	# @commentText = params[:commentText]

	# if @commentText.length <= 0
	# 	@error = 'Put the cockie down!'
	# 	return erb :details	
	# end

	# @db.execute 'INSERT INTO 
	# Comments (
	# 	createdDate, 
	# 	commentText,
	# 	article_id
	# ) VALUES (
	# 	datetime(), 
	# 	?,
	# 	?
	# )', [@commentText, article_id]

	# redirect to ('/details/' + article_id)	
end
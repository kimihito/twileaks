# -*- coding: utf-8 -*-
require 'sinatra'
require 'twitter'

Twitter.configure do |c|
  c.consumer_key = ENV["CONSUMER_KEY"]
  c.consumer_secret = ENV["CONSUMER_SECRET"]
  c.oauth_token = ENV["ACCESS_TOKEN"]
  c.oauth_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

get '/' do
  haml :index
end

post '/' do
  begin
    Twitter.update params[:text] + " #twileaks"
  rescue
    "エラーだよ!"
  end
  haml :index
end

__END__
@@ layout
%html
  = yield

@@ index
%h1 TwiLeaks
%form{:method => 'post'}
  %input{:type => '', :name => 'text'}
  %span{:id => 'count'}130
  %input{:type => 'submit', :value => 'leak'}
designed by
%a{:href => 'http://twitter.com/kimihito_'}@kimihito_
%br
implementation by
%a{:href => 'http://twitter.com/hanachin_'}@hanachin_

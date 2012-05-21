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
  erb :index
end

post '/' do
  begin
    Twitter.update params[:text] + " #twileaks"
  rescue
    "エラーだよ!"
  end
  erb :index
end

__END__
@@ layout
<html>
  <head>
    <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js' type='text/javascript'></script>
    <script src='main.js' type='text/javascript'></script>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@ index
<h1>TwiLeaks</h1>
<form method='post'>
  <input id='text' name='text' type='' />
  <span id='count'>130</span>
  <input type='submit' value='leak' />
</form>
designed by
<a href='http://twitter.com/kimihito_'>@kimihito_</a>
<br />
implementation by
<a href='http://twitter.com/hanachin_'>@hanachin_</a>

<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'search',
  search: '#twileaks',
  interval: 30000,
  title: '',
  subject: '',
  width: 'auto',
  height: 600,
  theme: {
    shell: {
      background: '#ffffff',
      color: '#ffffff'
    },
    tweets: {
      background: '#ffffff',
      color: '#444444',
      links: '#1985b5'
    }
  },
  features: {
    scrollbar: true,
    loop: false,
    live: true,
    behavior: 'all'
  }
}).render().start();
</script>

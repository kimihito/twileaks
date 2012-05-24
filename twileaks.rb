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
  # begin
  #   Twitter.update params[:text] + " #twileaks"
  # rescue
  #   "エラーだよ!"
  # end
  erb :index
end

__END__
@@ layout
<html>
  <head>
    <title>TwiLeaks</title>
    <link href="bootstrap.css" rel="stylesheet">
    <link href="docs.css" rel="stylesheet">
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js' type='text/javascript'></script>
    <script src='main.js' type='text/javascript'></script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-29293708-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

@@ index
<div class="container">
<header class="jumbotron masthead">
  <div class="inner">
    <h1>TwiLeaks</h1>
    <p>
      <del>匿名でつぶやきたいあなたへの最高のソリューションです</del><br/><br/>
      いろいろめんどくさそうだったので止めました。<br/>
      代わりにやってくれる人募集。ソースわたします。<br/>
      連絡は<a href="http://twitter.com/kimihito_">@kimihito_</a>まで
    </p>
    <form method='post'>
      <p>
        <textarea id='text' name='text' class="input-xlarge" placeholder="動かないよ"></textarea>
        <span id='count'>130</span><br/>
       <input class="btn btn-primary btn-large" type='submit' value='leak' />
      </p>
    </form>
  </div>
</header>

<div style="padding-left: 320px">
<script charset="utf-8" src="https://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'search',
  search: '#twileaks',
  interval: 30000,
  title: '',
  subject: '',
  width: 320,
  height: 300,
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
    scrollbar: false,
    loop: true,
    live: true,
    behavior: 'default'
  }
}).render().start();
</script>
design by
<a href='http://twitter.com/kimihito_'>@kimihito_</a>
implementated by
<a href='http://twitter.com/hanachin_'>@hanachin_</a>
</div>
</div>
</div>

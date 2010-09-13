require 'rubygems';
require 'json';
require 'oauth';

h = {
     :consumer_key        => 'キー',            #ここは各自ちがうよ
     :consumer_secret     => 'ひみつ',          #ここは各自ちがうよ
     :access_token        => 'トークン',        #ここは各自ちがうよ
     :access_token_secret => '秘密'             #ここは各自ちがうよ
    };

consumer = OAuth::Consumer.new(
                               h[:consumer_key],
                               h[:consumer_secret],
                               { :site => 'http://api.twitter.com' }
                              );

access_token = OAuth::AccessToken.new(
                                      consumer,
                                      h[:access_token],
                                      h[:access_token_secret]
                                     );

js = JSON.parse( access_token.get('http://api.twitter.com/1/statuses/followers.json?screen_name=koduki').body );
                               

puts js.map{ |i| i['name'] }.join("\n");


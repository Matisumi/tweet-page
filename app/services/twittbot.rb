require 'dotenv'
require 'twitter'


class Twittbot

	def initialize(message)

		@message = message

	end

	def perform

		puts "Loging in to twitter"

		log_in_to_twitter

		puts "send_tweet methode"
		send_tweet

		puts "end of perform"

		return 1

	end


	def log_in_to_twitter

		puts "Loging in"

		

		@client = Twitter::REST::Client.new do |config|
  		config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  		config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  		config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  		config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
		end

	end


	def send_tweet

		puts "sending tweet"

		@client.update(@message)

	end

end
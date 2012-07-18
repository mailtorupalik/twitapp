require 'jumpstart_auth'
require "twitter"
require 'date'


# jumpstart_auth is a gem used to supply the simplest form of authentication by passing the user’s username and password
# only once.

class JSTwitter
 
attr_reader :client    
 
# this method is called when object of JSTwitter is instantiated.

def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter 
end

def getstatus(target)

    tdate=Time.now
    before=Time.now - (7 * 60 * 60 * 24) 
    
    puts "todays date #{tdate}"
      
    puts "date before 7 days #{before}"
    
    tweet = Twitter.user_timeline(target)      #get all the tweets 
    count=0

    for each_tweet in tweet
           if each_tweet.created_at > before      
                puts " "    
                puts " #{count+1}.  #{each_tweet.text}"
                puts "Tweeted on #{each_tweet.created_at}"
                count=count+1
           end
    end

    puts " "     
    puts "TOTAL NUMBER OF TWEETS IN LAST 7 DAYS :: #{count}"

 end


def run
    puts " Welcome !!"

    command = ""

    while command != "q"
      puts ""
      printf "enter command: "
      input = gets.chomp            # get command and twitter handle  
      parts = input.split           #split input 
      command = parts[0]            
      case command
         when 'q' then puts "Goodbye!"
         when 'gs' then getstatus(parts[1]) 
         else
           puts "Sorry, I don't know how to (#{command})"
      end
    end


  end


jst = JSTwitter.new
#jst.tweet("JSTwitter Initialized")

jst.run

end

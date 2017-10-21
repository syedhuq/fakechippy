require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MzcwNjIwMTM0MTQ4Mjc2MjI0.DMpuww.lSf2ToH1w1Mjg5FmfRmmS5NcyfM', client_id: 370620134148276224, prefix: '!'

# Here we output the invite URL to the console so the bot account can be invited to the channel. This only has to be
# done once, afterwards, you can remove this part if you want
puts "This bot's invite URL is #{bot.invite_url}."


# cd \Ruby24-x64\lib\ruby\gems\2.4.0\gems
mean = false
bot.command :mode do |event|
  mean = !mean
  mode = mean ? "Mean" : "Fake"
  new_nick = mode + " Chippy"
  bot.profile.on(event.server.id).nick = new_nick
  #bot.execute_command(:nick=, event, new_nick)
  event.respond("#{mode} Chippy engaged.")
end
messages_fake = [
  "I bet even your farts smell \"good\"",
  "Me without you is like a \"nerd\" without \"braces\", a \"shoe\" without \"laces\", a\"sentence\"without\"spaces\"",
  "Babies and small \"animals\" probably *looooove* you",
  "You are...\"someone's\" reason to smile",
  "You are a \"champ\"",
  "You're a \"smart\" cookie",
  "You're the \"salsa\" to my tortilla chips. You...\"spice\" up my life",
  "My mom always asks me why I can't be \"more like...you\"",
  "I would \"share\" my dessert with you",
  "Is it \"hot\" in here or is it just...you?",
  "You're like a breath of \"fresh\" air",
  "Your smile is \"contagious\"",
  "You're a *greeeeat* \"example\" to others",
  "I like your \"style\"",
  "Even my cat \"likes\" you"
]
messages_mean = [
  "Is your ass jealous of the amount of shit that just came out of your mouth?",
  "Your birth certificate is an apology letter from the condom factory.",
  "I'd give you a nasty look but you've already got one.",
  "I've seen people like you before, but I had to pay admission.",
  "Did you know they used to be called \"Jumpolines\" until your mum jumped on one?",
  "Save your breath - you'll need it to blow up your date.",
  "Whatever kind of look you were going for, you missed.",
  "Brains aren't everything. In your case they're nothing."  
]
bot.message do |event|
  if event.message.to_s.downcase.include?("chip")
    if mean
      randval = rand(messages_mean.length)
      str = messages_mean[randval]
    else
      randval = rand(messages_fake.length)
      str = messages_fake[randval]+"... :thinking:"
    end
    event.respond(str)
  end
end

bot.run
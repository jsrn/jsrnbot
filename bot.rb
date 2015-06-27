#!/usr/bin/env ruby

require 'cinch'

def say(words)
  system "espeak -v en-sc -k5 -s150 \"#{words}\""
end

bot = Cinch::Bot.new do
  configure do |c|
    c.nick   = "jsrnbot"
    c.server = "irc.freenode.org"
    c.channels = ["#slothkrew"]
  end

  on :message, /jsrnbot: (.+)/ do |_, arg|
    command = arg
    command = command.split(";").first
    command = command.split("&").first
    command = command.gsub(/[^A-Za-z0-9 ]/, "")
    say command
  end
end

bot.start

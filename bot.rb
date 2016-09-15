#!/usr/bin/env ruby

require 'cinch'

require_relative "modules/speech.rb"
require_relative "modules/video_identifier.rb"

YOUTUBE_REGEX = /^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$/

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = "jsrnbot"
    c.server = "irc.freenode.org"
    c.channels = ["#slothkrew"]
  end

  on :message, /jsrnbot: (.+)/ do |_, message|
    Speech.say(message)
  end

  on :message, /(.*)/ do |m, message|
    youtube_match = message =~ YOUTUBE_REGEX

    if youtube_match
      m.reply VideoIdentifier.identify(message)
    end
  end
end

bot.start

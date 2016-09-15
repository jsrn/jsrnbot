require "video_info"

class VideoIdentifier
  PERSON_DESCRIPTORS = [
    "sick puppy", "mysterious vagabond", "inscrutable rascal", "elite hacker",
    "upstart rapscallion"
  ]

  def self.identify(url)
    video = VideoInfo.new(url)
    "Some #{PERSON_DESCRIPTORS.sample} just linked to '#{video.title}' by '#{video.author}'"
  end
end

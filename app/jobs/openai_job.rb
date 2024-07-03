require "open-uri"

class OpenaiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @video_content = VideoContent.find(args[0])
    transcription = args[1]

    client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_ACCESS_TOKEN"))

    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [
        { 
          role: "user", 
          content: "Given the #{transcription} you will be a helpful assistant that will summarize the transcription to higlight the key point of the youtube video transcription."
        }
      ]
    })
    binding.pry

    new_content = chaptgpt_response["choices"][0]["message"]["content"]
    binding.pry
    @video_content.update(content: new_content)
  end
end
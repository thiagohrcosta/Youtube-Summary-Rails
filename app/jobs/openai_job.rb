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
          content: "Summarize the given #{transcription}, highlighting the key points of the YouTube video. 
          The summary must be in English, even if the transcription is in another language. 
          Create an engaging and captivating summary suitable for a website or magazine, without using phrases like 
          'the key point of this transcription' or referencing the transcription itself. 
          Focus on drawing the user's attention to the content of the video."
        }
      ]
    })

    new_content = chaptgpt_response["choices"][0]["message"]["content"]
    @video_content.update(content: new_content)
  end
end

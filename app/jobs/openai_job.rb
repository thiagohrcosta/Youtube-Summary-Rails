class OpenaiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    binding.pry
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [
        { 
          role: "user", 
          content: "Given the #{transcription} you will be a helpful assistant that will summarize the transcription to higlight the key point of the youtube video transcription."
        }
      ]
    })
    new_content = chaptgpt_response["choices"][0]["message"]["content"]

    puts new_content
  end
end

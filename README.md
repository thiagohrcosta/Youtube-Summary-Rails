
# Youtube Summary Rails

**YouTube Summary Rails** is a web application that allows users to add a title, video URL, and video transcription to generate a compelling and stylish summary for their YouTube videos, helping to maximize their views. Inspired by the concepts taught in _Developing Apps with GPT-4_ from O'Reilly, this project demonstrates how to build a practical application using Ruby on Rails, despite the book's examples being in Python.

The application seamlessly integrates system components, CRUD operations, and background jobs to create a "real-world app" experience. The primary objective is to leverage GPT's AI capabilities to generate accurate and engaging summaries from video transcriptions.


![Book cover](https://res.cloudinary.com/dloadb2bx/image/upload/v1721579303/51rDIzpBuGL_hcgjho.jpg)

## Technologies
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white) ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white) ![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white) ![ChatGPT](https://img.shields.io/badge/chatGPT-74aa9c?style=for-the-badge&logo=openai&logoColor=white)

**Key Features:**

-   Add and manage video titles, URLs, and transcriptions.
-   Automatically generate summaries using AI to enhance video content.
-   User-friendly interface for managing summaries.
-   Built with Ruby on Rails, showcasing MVC architecture and Rails best practices.

## How to test
1. Adding content:
![image](https://github.com/user-attachments/assets/c4758060-cde8-46a6-b0a2-0f11c8b6b003)

2. See the result:
![image](https://github.com/user-attachments/assets/c7d424de-0ff4-4c18-9e70-df8a04bed626)
 
 ## How to run it
 Clone the repository: 
 ``git@github.com:thiagohrcosta/Youtube-Summary-Rails.git``
 
 Database creation:
 ``rails db:create db:migrate db:seed``

Run server:
``rails s``

Seeds a default user for easy initial setup:
``email: johndoe@doe.com``
``password: 123456``

## .Env file
OPENAI_ACCESS_TOKEN="your token"

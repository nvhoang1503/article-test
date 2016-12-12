# ARTICLE TEST

* Ruby version: 2.2.3

* Library: rmagick

* Gem: 

  - Catpix: Print image on console 

  - Rspec: ruby test


# How to run in local computer

* Clone code from Github
  - In local computer, open terminal
  - Create a folder : mkdir testing
  - Go to the testing folder: cd testing
  - Clone the source code: git clone git@github.com:nvhoang1503/article-test.git

* Source code structure
  - article-test  
    - bin
      - basic_info.rb
      - gt_article.rb
      - gt_common.rb
      - gt_content.rb    
      - gt_photo.rb
      - gt_text.rb
      - main.rb
    - images
      - ruby_logo.jpeg
      - Yukihiro_Matsumoto.JPG
    - spec
      - gt_article_spec.rb
      - gt_content_spec.rb
      - gt_photo_spec.rb
      - gt_text_spec.rb
      - spec_helper.rb 
    - Gemfile
    - Gemfile.lock
    - README.md
    - requirement.txt    

* Run bundle install gem 
  - In the local terminal
  - cd article-test
  - bundle install

* Run Rspec ( automation test )
  - In the local terminal
  - Go to the article folder ( cd article-test )
  - Run: rspec spec

* Run the app in main.rb 
  - In the local terminal
  - Go to the article folder ( cd article-test )
  - Run: ruby bin/main.rb

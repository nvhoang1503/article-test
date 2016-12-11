require_relative "gt_text.rb"
require_relative "gt_photo.rb"
require_relative "gt_content.rb"
require_relative "gt_article.rb"
require_relative "gt_common.rb"

#==== DEFINE EXAMPLE DATA ========
a_title_1 = "Yukihiro Matsumoto"
a_title_2 = "Ruby (programming language)"

t_headline_1 = "From Wikipedia, the free encyclopedia"
t_headline_2 = "Internet"
t_sentence_1 = "Yukihiro Matsumoto (まつもとゆきひろ Matsumoto Yukihiro?, " \
              "a.k.a. Matz, born 14 April 1965) is a Japanese computer scientist" \
              "and software programmer best known as the chief designer of the Ruby programming language " \
              "and its reference implementation, Matz's Ruby Interpreter (MRI). " \
              "His demeanor has brought about a motto in the Ruby community: "\
              "Matz is nice and so we are nice, commonly abbreviated as MINASWAN."\
              "\nAs of 2011, Matsumoto is the Chief Architect of Ruby at Heroku, "\
              "an online cloud platform-as-a-service in San Francisco. "\
              "He is a fellow of Rakuten Institute of Technology, a research and development organisation in Rakuten Inc. "\
              "He was appointed to the role of technical advisor for VASILY, Inc. starting in June 2014"


t_sentence_2 =  "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language." \
                " It was designed and developed in the mid-1990s by Yukihiro Matz Matsumoto in Japan." \
                "\nAccording to its creator, Ruby was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. "\
                "It supports multiple programming paradigms, including functional, object-oriented, and imperative. "\
                "It also has a dynamic type system and automatic memory management."              

images_folder = File.expand_path("../../images", __FILE__)
p_url_1 = "#{images_folder}/Yukihiro_Matsumoto.JPG"
p_url_2 = "#{images_folder}/ruby_logo.jpeg"
p_headline_1 = "14 April 1965 Osaka Prefecture, Japan"
p_headline_2 = "Stable release: 2.3.3 / November 21, 2016"


text  = GtText.new({:headline => t_headline_1, :sentence => t_sentence_1 })
photo = GtPhoto.new({:headline => p_headline_1, :url => p_url_1, :position => 1})

# init content for article
content = GtContent.new(text, photo)
article = GtArticle.new(a_title_1,content)

puts "==================================================="
puts "================= The article info ================"
puts "==================================================="
# Print the article content
article.display 

puts "==================================================="
puts "================= Update the article info ================"
puts "==================================================="
# Update text
text.update({:headline => t_headline_2, :sentence => t_sentence_2})

# Update photo
photo.update({:headline => p_headline_2, :url => p_url_2})

# Update content of the article
content.update({:text => text, :content => content})

# Update the article
article.update({:title => a_title_2, :content => content})

# Print the article content
article.display 


puts "==================================================="
puts "======= Like text and photo of the article ========"
puts "==================================================="
article.content.text.like
article.content.photo.like
# Print the article content
article.display 


puts "==================================================="
puts "================= The article info ================"
puts "==================================================="
article.info  # Print the article info

puts "==================================================="
puts "================ Post the article ================="
puts "==================================================="
article.post
article.info  # Print the article info

puts "==================================================="
puts "================ Like the article ================="
puts "==================================================="
article.like
article.info  # Print the article info

puts "==================================================="
puts "================ Active the article  =============="
puts "==================================================="
article.mark_active # mark the article to active 
article.info  # Print the article info






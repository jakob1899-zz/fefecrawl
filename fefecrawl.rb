# encoding: utf-8
require 'nokogiri'
system("wget -q -O fefesblog.html blog.fefe.de")

rawhtml = File.open("fefesblog.html","r")
html = rawhtml.read()
File.delete("fefesblog.html")
doc = Nokogiri::HTML.parse(html)
links = doc.css('ul a').map { |link| link['href'] }
counter = 0
while counter < links.length do
  	if links[counter].match(/https?:\/\/[\S]+/)		#filters the links to the single article on fefe's blog
    		counter = counter + 1
	else
		links.delete_at(counter)
		counter = counter + 1
	end
end
#system("touch links.html")					#creates file with the array andopwns it in google chrome
#File.open('links.html', 'w') { |file| file.write(links)}	#it's optional. alternative the links are print to
#system("google-chrome links.html")				# the command prompt
#sleep(10)
#File.delete("links.html")

puts links							

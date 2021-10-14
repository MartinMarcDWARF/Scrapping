require 'pry'
require 'nokogiri'
require 'open-uri'


for i in "Veuillez patienter je recueilles les données...".chars.to_a
  print i
  sleep 0.1
end


PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
cryptos_array = []
page.css(".cmc-table-row").each.with_index do |row, i|

name_array = row.css(".cmc-table__cell--sort-by__symbol").text
value_array = row.css('.cmc-table__cell--sort-by__price').text.gsub("$", "").gsub(",", "").to_f
name_array != "" ? cryptos_array[i] = {name_array => value_array} : nil
  
end 

puts cryptos_array
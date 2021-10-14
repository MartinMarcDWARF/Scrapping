require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_deputes_name

  deputes_name_array = []
  
  page_url_deputes = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

  depute_page = Nokogiri::HTML(URI.open(page_url_deputes))

  
  return deputes_name_array = depute_page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/text()").map {|x| x.to_s }
end


def get_deputes_link

  deputes_name_array = []

  page_url_deputes = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

  depute_page = Nokogiri::HTML(URI.open(page_url_deputes))

  
  return deputes_name_array = depute_page.xpath("//*[contains(@id, 'deputes-list')]/div/ul/li/a/@href").map {|x| x.to_s }
end


def get_deputes_email (deputes_names)

  deputes_email_array = []

  
  # On peut mettre 10 pour ne pas avoir de latence et attendre 1000 ans, pour avoir toute la liste il faut remplacer 10 par deputes_names.length
  for n in 0...10

  
    page_url_deputes = "https://www2.assemblee-nationale.fr/#{deputes_names[n]}"

  
    depute_page = Nokogiri::HTML(URI.open(page_url_deputes))

    
    begin

     
      deputes_email_array << depute_page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text.gsub("=", "").gsub(",", "")
    rescue => e

        deputes_email_array << " "
      end
    end


  
  return deputes_email_array
end


puts email_ville_result = Hash[get_deputes_name.zip(get_deputes_email(get_deputes_link))]

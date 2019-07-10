require 'httparty'
require 'nokogiri'
require 'byebug'

def url
    url = {"Interglobe Aviation Ltd."=>"https://www.moneycontrol.com/india/stockpricequote/transport-logistics/interglobeaviation/IA04",
        "SBI"=>"https://www.moneycontrol.com/india/stockpricequote/banks-public-sector/statebankindia/SBI",
        "ICICI"=>"https://www.moneycontrol.com/india/stockpricequote/banks-private-sector/icicibank/ICI02",
        "TCS"=>"https://www.moneycontrol.com/india/stockpricequote/computers-software/tataconsultancyservices/TCS",
        "Titan Company"=>"https://www.moneycontrol.com/india/stockpricequote/miscellaneous/titancompany/TI01"
    }
end

def scrapper
    mutex = Mutex.new
    threads = []
    url.each do |key, val|
        threads << Thread.new(key,val) { |name,single_url|
            listing = Nokogiri::HTML(HTTParty.get(single_url)).css('div.PA10')
            stock = listing.css('div.FL').css('div#content_full').css('div#content_bse').css('div.brdb').css('div#Bse_Prc_tick_div').css('span#Bse_Prc_tick').text
            mutex.synchronize do
                file = File.open("history.txt", "a")
                p "#{name}: #{stock}"
                file.puts "#{name}: #{stock}"
                file.close
            end
            # sleep(2)
        }
    end
    threads.each { |aThread| aThread.join }
    # byebug
end

# while(gets == "\n") do scrapper end   
loop do
    scrapper
    # system("clear")
    sleep(5)
    puts`clear`
    file = File.open("history.txt", "a")
    file.puts
    file.close
    break unless Thread.current.alive?
end
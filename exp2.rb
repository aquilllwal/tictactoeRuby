module Abc
    attr_accessor :name, :weight
    def printer
        puts "#{@name}\'s weight is #{@weight}"
    end
end

class Aquil
    include Abc
end

class Adil
    include Abc
end

a = Aquil.new
a.printer
a.name = "Aquil"
a.weight = 73.1
a.printer

aa = Adil.new
aa.name = "Adil"
aa.weight = 72.9
aa.printer
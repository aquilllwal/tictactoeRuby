# module Abc
#     attr_accessor :name, :weight
#     def printer
#         puts "#{@name}\'s weight is #{@weight}"
#     end
# end

# class Aquil
#     include Abc
# end

# class Adil
#     include Abc
# end

# a = Aquil.new
# a.printer
# a.name = "Aquil"
# a.weight = 73.1
# a.printer

# aa = Adil.new
# aa.name = "Adil"
# aa.weight = 72.9
# aa.printer
require 'rollbar'

Rollbar.configure do |config|
  config.access_token = 'ff49f2d4a07d4f7781c2fccb6b29e259'
end

Rollbar.error('Hello world')

begin
    1/0
rescue StandardError => e # Never rescue Exception *unless* you reraise in rescue body
    Rollbar.error(e)
    raise e
end
  
  
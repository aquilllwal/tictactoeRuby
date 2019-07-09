class NoSuchMoves < StandardError
    def initialize(message)
        super(message)
    end
end

# raise NoSuchMoves.new("No such move available: #{3}")
# begin
#     raise NoSuchMoves.new("No such move available: #{3}")
# rescue NoSuchMoves => e
#     p e.message
# end
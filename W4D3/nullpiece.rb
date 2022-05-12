require 'singleton'
require_relative "piece.rb"
class Nullpiece < Piece
    attr_reader :symbol, :color
    include Singleton
    def initialize
        @symbol = :empty
        @color = :none
    end
    def empty?
        return true
    end
end

class KnightPathFinder

    attr_accessor :root_node
    attr_reader : starting_pos, 
    MOVES = [[1, 2], [2, 1], [-1, 2], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1]]

    def self.valid_moves(pos)
        moves = []
        x, y = pos
        MOVES.each do |i, j|
            new_pos = [i+x, j+y]
            if new_pos.all? { |valid| valid.between?(0, 7)}
                moves << new_pos
            end
        end
        moves
    end

    def initialize(starting_pos)
        @starting_pos = starting_pos
        @root_node = [0, 0]
        @considered_positions = [starting_pos]
    end
     
    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)

        nodes = [root_node]
        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.value
        new_move_positions(current_pos).each do |next_pos|
            next_node = PolyTreeNode.new(next_pos)
            current_node.add_child(next_node)
            nodes << next_node
        end
    end
    
    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
      .reject { |new_pos| considered_positions.include?(new_pos) }
      .each { |new_pos| considered_positions << new_pos }

    end

    
end
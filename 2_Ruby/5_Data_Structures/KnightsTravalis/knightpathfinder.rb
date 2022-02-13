require_relative "polytreenode"

OFFSETS = [[-2, -1], [-2, 1], [2, -1], [2, 1],
[-1, -2], [-1, 2], [1, -2], [1, 2]]

class KnightPathFinder
    def self.valid_moves(pos)
        possible_moves = OFFSETS.map { |offset| [offset[0]+pos[0], offset[1]+pos[1]] }
        possible_moves.select { |pos| KnightPathFinder.inside_board?(pos) }
    end

    def self.inside_board?(pos)
        # chess grid 8x8
        row, col = pos
        row.between?(0,7) && col.between?(0,7)
    end

    attr_reader :start_pos
    attr_accessor :root_node, :considered_positions
    
    def initialize(starting_pos)
        @start_pos = starting_pos
        @considered_positions = [starting_pos]
        self.build_move_tree
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos)
        new_positions.reject { |pos| considered_positions.include?(pos) }
                .each { |new_pos| considered_positions << new_pos }
    end

    # build tree using BFS algo
    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)
        queue = [root_node]

        until queue.empty?
            node = queue.shift

            new_move_positions(node.value).each do |pos|
                child_node = PolyTreeNode.new(pos)

                # add node to queue
                queue.push(child_node)

                # set parent-child relationship
                child_node.parent = node
                node.add_child(child_node)
            end
        end
    end

    # search for end node using DFS algo
    def find_path(end_pos)
        end_node = root_node.dfs(end_pos)
        return trace_path_back(end_node) unless end_node == nil
        nil
    end

    def trace_path_back(node)
        path = []

        current_node = node
        until current_node == nil
            path.unshift(current_node.value)
            current_node = current_node.parent
        end
        path
    end
end

if $PROGRAM_NAME == __FILE__
    kpf = KnightPathFinder.new([0, 0])
    print kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
    puts

    print kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
    puts
end
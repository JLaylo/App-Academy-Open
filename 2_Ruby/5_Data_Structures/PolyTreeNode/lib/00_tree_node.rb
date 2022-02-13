class PolyTreeNode
    attr_reader :parent
    attr_accessor :value
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    # redefine inspect method
    def inspect
        {'children' => @children }.inspect
    end

    # ensure user cannot modify chidlren array
    def children
        @children.dup
    end

    def parent=(new_parent)
        # remove self from old parent's children
        parent._children.delete(self) unless parent == nil

        @parent = new_parent
        # add node to new parent's children
        parent._children << self unless parent == nil
    end

    def add_child(child)
        child.parent = self
        @children << child unless children.include?(child)
    end

    def remove_child(child)
        child.parent = nil

        if children.include?(child)
            @children.delete(child)
        else
            raise "Not a child of node"
        end
    end

    def dfs(target_val)
        return self if target_val == value
        children.each do |child|
            search_result = child.dfs(target_val)
            return search_result unless search_result == nil
        end
        nil
    end

    def bfs(target_val)
        queue = [self]

        until queue.empty?
            node = queue.shift
            if target_val == node.value
                return node
            else
                queue += node.children
            end
        end

        nil # if not found
    end

    protected

    # allow other nodes to access children
    def _children
        @children
    end

end
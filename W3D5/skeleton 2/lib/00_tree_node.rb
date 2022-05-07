class PolyTreeNode
    require 'byebug'

    attr_reader :value, :parent, :children
    attr_writer :value
    

    def initialize(value=nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        
        if @parent
            idx = @parent.children.index(self)
            @parent.children.delete_at(idx)
        end
        @parent = node
        if @parent != nil && !parent.children.include?(self)
            parent.children << self
        end
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        if @children.include?(node)
            node.parent = nil
        else 
            raise 'error'
        end
    end

    def dfs(target)
      return self if self.value == target
      return nil if self.children.empty?
         @children.each do |child|
            stack = child.dfs(target)
            if stack
                return stack
            end
        end
        nil
    end

    def bfs(target)
      arr = []
      arr.push(self)
      until arr.empty?
        
        if arr[0].value == target
            return arr[0]
        else
            arr.shift
            arr.concat(self.children)
        end
      end
      nil
    end
end
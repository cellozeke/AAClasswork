require 'byebug'

class PolyTreeNode
    attr_reader :value, :parent
    attr_accessor :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        'some_node'
    end

    def parent=(node)
        @parent.children.delete(self) unless @parent.nil?
        @parent = node
        return nil if @parent.nil?
        node.children << self unless node.children.include?(self)
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        node.parent = nil 
        raise unless children.include?(node)
    end

    def dfs(target)
        return self if value == target
        children.each do |child|
            # debugger
            search = child.dfs(target)
            return search unless search.nil?
        end
        nil
    end

    def bfs(target)
        queue = [self]
        
        until queue.empty?
            search = queue.shift #node
            return search if search.value == target
            queue += search.children
        end
        nil

    end
end




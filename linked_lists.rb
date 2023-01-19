class Node

    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end

end

class LinkedList

    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        new_node = Node.new(value)
        @head = new_node if @head.nil?
        @tail.next_node = new_node
        @tail = new_node
    end

    def prepend(value)
        new_node = Node.new(value, @head)
        @head = new_node
        @tail = new_node if @tail.nil?
    end

end

list = LinkedList.new
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

    def size
        counter = 0
        current_node = @head
        until current_node.nil?
            counter += 1
            current_node = current_node.next_node
        end
        counter
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def at(index)
        return 'Error, given index is invalid.' if index.negative?

        targeted_node = @head
        targeted_index = 0
        until targeted_index == index
            targeted_index += 1
            targeted_node = targeted_node.next_node
        end
        targeted_node
    end
end

list = LinkedList.new
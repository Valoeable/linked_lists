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
        @tail.next_node = new_node if @tail
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

    def at(index)
        return 'Error: given index is invalid.' if index.negative?

        targeted_node = @head
        targeted_index = 0
        until targeted_index == index
            targeted_index += 1
            targeted_node = targeted_node.next_node
        end
        targeted_node
    end

    def pop
        return 'Error: zero values found.' if self.size.zero?

        if self.size == 1
            @head = nil
            return 
        end
        current_node = @head
        targeted_index = 1
        previous_size = self.size
        until targeted_index == previous_size
            if targeted_index == self.size - 1
                current_node.next_node = nil
                targeted_index += 1
                next
            else
                targeted_index += 1
                current_node = current_node.next_node
            end
        end
        @tail = current_node
    end

    def contains?(value)
        current_node = @head
        until current_node.nil?
            if current_node.value == value
                return true
            else
                current_node = current_node.next_node
            end
        end
        false
    end

    def find(value)
        return 'Error: zero values found.' if self.size.zero?

        current_node = @head
        targeted_index = 0
        until current_node.nil?
            return targeted_index if current_node.value == value

            targeted_index += 1
            targeted_node = targeted_node.next_node
        end
        nil
    end

    def to_s
        current_node = @head
        until current_node.nil?
            print ("(#{current_node.value}) -> ")
            current_node = current_node.next_node
        end
        p current_node
    end
end

list = LinkedList.new


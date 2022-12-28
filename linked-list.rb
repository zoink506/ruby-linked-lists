# append(value) - adds a new node containing value to end of list                 <
# prepend(value) - adds a new node containing value to start of list              <
# size - returns total number of nodes in list                                    <
# head - retruns the first node in the list                                       <
# tail - returns the last node in the list                                        <
# at(index) - returns the node at the given index                                 <
# pop - removes the last element from the list                                    >
# contains?(value) returns true if the value is in the list, otherwise false      >
# find(value) - returns the index of the node containig value, nil if not found   >
# to_s - turns the entire linked list into a string to be printed out to console  >
# index is not assigned, but counted when asked for by a method                   >

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  public
  def append(value)
    # Create node,
    # If list is empty, set @head to the new node, set @tail to the new node
    # If list is not empty, set @tail to the new node, edit previous tail to point to new node
    # If head or tail are nil, then the list is empty
    new_node = Node.new(value)
    if @head.nil? || @tail.nil? # list is empty
      @head = new_node
      @tail = new_node
    else # list is not empty
      @tail.next = new_node
      @tail = new_node
    end

    return new_node
  end

  def prepend(value)
    # Create new node
    # If list is empty, set @head and @tail to the new node
    # If list is not empty, set the new node's next to the current head
    # Set the head to the new node
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head = new_node
    end

  end

  def to_s(str = "", node = @head)
    # recursive method
    # Start at @head
    # puts node data
    # goes to next node
    # repeat until the tail is reached
    return "Empty List" if @head.nil?
    
    if node.next.nil? 
      str += "(#{node.data})" # Adds the tail's data
      return str              # Then returns str, ending method
    end
    str = to_s(str + get_node_data(node), node.next)
  end

  def size(count = 0, node = @head)
    return 0 if @head.nil?

    count += 1 if !node.nil?
    return count if node.next.nil?
    size(count, node.next)
  end

  def head
    @head
  end

  def tail 
    @tail
  end

  def at(index, count = 0, node = @head)
    # Return the node at the given index
    # If index cannot be found (i.e, list is empty), return :error
    # 0 based indexing (@head index = 0)
    return nil if @head.nil?
    return node if count == index # base case
    return nil if node.next.nil?
    at(index, count + 1, node.next)
  end

  def pop
    # Sets node before @tail to be @tail
    # 
    # Loop through size - 2 times to find the node before @tail
    size = self.size
    if size > 1
      node = self.at(size - 2)
    elsif size == 1
      node = @head
    elsif size < 1
      node = nil
    end

    if !node.nil?
      if size == 1
        @head = nil
        @tail = nil
      else
        node.next = nil
        @tail = node
      end
    end

    puts "2nd last node: #{node.data}"
    return node
  end

  private
  def get_node_data(node)
    "(#{node.data}) -> "
  end
end

class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end

my_list = LinkedList.new
#my_list.append("Ben")
my_list.append("Jack")
#my_list.append("SAMMY")
my_list.prepend("Jimmothy")
#my_list.prepend("Sherdan")
my_list.prepend("Jeff")
my_list.prepend("Wong")
#my_list.append("Jimmyboy")
puts my_list.to_s
#p my_list
puts my_list.size
#p my_list.head.data
#p my_list.tail.data
#p my_list.at(2)
my_list.pop
#my_list.pop
#my_list.pop
#my_list.pop

puts my_list.to_s
require_relative "node"
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize(data = nil)
    @head = nil
    # @head = Node.new(data)
    @tail
  end

  def tail
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    @tail = current_node
  end

  def append(data)
      if @head.nil?
        @head = Node.new(data)
      else
        new_node = Node.new(data)
        tail.next_node = new_node
      end
    end

  def count
    current_node = @head
      count = 1
      until current_node.next_node == nil
        current_node = current_node.next_node
        count += 1
      end
      count
    end

  def to_string
    current_node = @head
    string = ""
    until current_node.next_node == nil
      string += current_node.data + " "
      current_node = current_node.next_node
    end
    if current_node.next_node.nil?
      string += current_node.data
    end
    string
  end

  def prepend(data)
    head = Node.new(data)
    head.next_node = @head
    @head = head
  end

  def insert(index, data)
    current_location = 0
    node_after = @head
    until current_location == index
      node_before = node_after
      node_after =  node_after.next_node
      current_location += 1
    end
    node_to_insert = Node.new(data)
    node_before.next_node = node_to_insert
    node_to_insert.next_node = node_after
  end

  def find(index, how_many)
    current_node = @head
    count = 0
    until count == index
      current_node = current_node.next_node
      count += 1
    end
    string = ""
      how_many.times do
        string << current_node.data + " "
        current_node = current_node.next_node
    end
    string.strip
  end

  def includes?(data)
    current_node = @head
    until current_node == nil
      return true
    if current_node.next_node == data
      current_node = current_node.next_node
    end
      false
    end
  end

  def pop
    current_node = @head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    last_data = tail.data
    current_node.next_node = nil
    last_data
  end
end

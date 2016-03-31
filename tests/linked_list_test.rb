require "minitest/autorun"
require "minitest/pride"
require "./lib/linked_list"
require "./lib/node"
require 'pry'


class LinkedListTest < MiniTest::Test
  def test_it_can_be_created_with_nil_data
    list = LinkedList.new
    assert LinkedList
    assert_equal nil, list.head
  end

  def test_it_exists
    list = LinkedList.new('doop')
    assert LinkedList
  end

  def test_we_can_pass_a_node_data
    list = LinkedList.new
    list.append("doop")
    assert 'doop', list.head.data
  end

  def test_that_we_can_find_the_tail
    list = LinkedList.new
    list.append("doop")
    assert 'doop', list.tail.data
  end

  def test_you_can_append
    list = LinkedList.new('doop')
    list.append('deep')
    assert_equal 'deep', list.tail.data
    assert_equal nil, list.tail.next_node
  end

  def test_you_can_count
    list = LinkedList.new
    list.append('doop')
    assert_equal 1, list.count
    list.append('doop')
    assert_equal 2, list.count
  end

  def test_can_convert_data_to_string
    list = LinkedList.new
    list.append('doop')
    assert_equal "doop", list.to_string
    assert list.to_string.is_a?(String)
    list.append("deep")
    assert_equal "doop deep", list.to_string
    list.append("daap")
    assert_equal "doop deep daap", list.to_string
  end

  def test_it_can_prepend
    list = LinkedList.new
    list.append("plop")
    assert_equal "plop", list.head.data
    list.append("suu")
    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
    assert_equal "dop", list.head.data
    assert_equal 3, list.count
  end

  def test_can_it_insert
    list = LinkedList.new
    list.append("plop")
    assert_equal "plop", list.head.data
    list.append("suu")
    list.prepend("dop")
    assert_equal "dop plop suu", list.to_string
    assert_equal "dop", list.head.data
    assert_equal 3, list.count

    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
  end

  def test_can_it_find
    list = LinkedList.new
    list.append("plop")
    assert_equal "plop", list.head.data
    list.append("suu")
    list.prepend("dop")
    list.prepend("deep")
    assert_equal "deep dop plop suu", list.to_string
    assert_equal "deep", list.head.data
    assert_equal 4, list.count

    assert_equal "plop", list.find(2, 1)
    assert_equal 4, list.count

    assert_equal "deep dop plop", list.find(0, 3)
  end


  def test_if_includes_works
    list = LinkedList.new
    list.append("plop")
    assert_equal "plop", list.head.data
    list.append("suu")
    list.prepend("dop")
    list.prepend("deep")
    assert_equal "deep dop plop suu", list.to_string
    assert_equal "deep", list.head.data
    assert_equal 4, list.count
    assert true, list.includes?("suu")
    refute_equal false, list.includes?("slap")
  end

  def test_can_pop
    list = LinkedList.new
    list.append("plop")
    assert_equal "plop", list.head.data
    list.append("suu")
    list.prepend("dop")
    list.prepend("deep")
    assert_equal "deep dop plop suu", list.to_string

    assert_equal "suu", list.pop
    assert_equal 3, list.count
    assert_equal "plop", list.pop
    assert_equal 2, list.count
  end

end

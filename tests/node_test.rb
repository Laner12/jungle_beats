require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/node"

class NodeTest < MiniTest::Test

    def test_can_have_data
      node = Node.new("plop")
      assert_equal "plop", node.data
    end

    def test_next_node
      node = Node.new("plop")
      assert_equal nil, node.next_node

    end

  end

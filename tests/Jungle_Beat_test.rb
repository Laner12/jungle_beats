require "minitest/autorun"
require "minitest/pride"
require "./lib/linked_list"
require_relative "../lib/Jungle_Beat"
require 'pry'


class JungleBeatTest < MiniTest::Test
  def test_it_can_be_created_with_nil_data
    jb = JungleBeat.new
    assert JungleBeat
    assert_equal nil, jb.list.head
  end

  def test_it_can_append
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
  end

  def test_it_can_count
    jb = JungleBeat.new
    jb.append("deep doo ditt")
    assert_equal 3, jb.count
  end

  def test_it_can_play
    jb = JungleBeat.new
    jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom ")
    jb.play
  end

  def test_it_can_change
    jb = JungleBeat.new
    jb.append("ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom ")
    jb.rate = 50
    jb.voice = "Alice"
    jb.play
  end
  end

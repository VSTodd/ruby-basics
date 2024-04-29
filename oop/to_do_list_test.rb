require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)
  end

  def test_add_error
    assert_raises(TypeError) {@list.add(5)}
    assert_raises(TypeError) {@list.add('woof')}
    assert_raises(TypeError) {@list.add([5, 'woof'])}
  end

  def test_add
    todo4 = Todo.new('Make dinner')
    @todos << todo4
    @list.add(todo4)
    assert_equal(@todos, @list.to_a)
  end

  def test_shovel
    todo4 = Todo.new('Make dinner')
    @todos << todo4
    @list << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) {@list.item_at(10)}
  end

  def test_mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(10)}
    @list.mark_done_at(1)
    refute(@todo1.done?)
    assert(@todo2.done?)
    refute(@todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(10)}
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(1)
    assert(@todo1.done?)
    refute(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_done!
    @list.done!
    assert(@list.done?)
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) {@list.remove_at(10)}
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_one_done_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @todo1.done!
    assert_equal(output, @list.to_s)
  end

  def test_all_done_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    collection = []
    @list.each {|todo| collection << todo}
    assert_equal(collection, @list.to_a)
  end

  def test_each_return
    assert_equal(@list, @list.each {|ea| nil })
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end

  def test_all_done
    @todo2.done!
    assert_equal([@todo2], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo2.done!
    assert_equal([@todo1, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done('Go to gym')
    assert(@todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert(@list.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    refute(@list.done?)
  end
end
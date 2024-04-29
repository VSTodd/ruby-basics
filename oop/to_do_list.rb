class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(list)
    if list.class == Todo
      todos << list
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  alias_method :<<, :add

  def size
    todos.length
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    !(todos.map {|todo| todo.done?}.include?(false))
  end

  def item_at(index)
    raise IndexError unless index < todos.length
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError unless index < todos.length
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError unless index < todos.length
    todos[index].undone!
  end

  def done!
    todos.each {|todo| todo.done!}
  end

  def remove_at(index)
    raise IndexError unless index < todos.length
    todos.delete_at(index)
  end

  def to_s
    text = "---- Today's Todos ----"
    todos.each do |todo|
      text << "\n"
      text << todo.to_s
    end
    text
  end

  def to_a
    todos
  end

  def each
    todos.each {|todo| yield(todo)}
    self
  end

  def select
    selected = TodoList.new('Selected Todos')
    each do |todo|
      selected.add(todo) if yield(todo)
    end
    selected
  end

  def find_by_title(string)
    select { |todo| string.downcase == todo.title.downcase }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(string)
    find_by_title(string).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private

  attr_reader :todos

end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!
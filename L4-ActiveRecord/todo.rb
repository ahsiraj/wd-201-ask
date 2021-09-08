require "active_record"

require "./connect_db.rb"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end
end

connect_db!
Todo.create!(todo_text: "Buy groceries", due_date: Date.today + 4, completed: false)
Todo.create!(todo_text: "Call Acme Corp.", due_date: Date.today + 2, completed: true)
Todo.create!(todo_text: "File taxes", due_date: Date.today, completed: false)

todo = Todo.first
todo.todo_text = "Buy groceries and fruits"
todo.save

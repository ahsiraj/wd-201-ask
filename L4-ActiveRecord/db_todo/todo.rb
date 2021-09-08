require "active_record"
require "./connect_db.rb"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    today = Date.today

    puts "My Todo-list\n\n"

    puts "Overdue\n"
    overdue_list = all.where("due_date < 'today'")
    overdue_list_displayable = overdue_list.to_displayable_list
    puts overdue_list_displayable
    puts "\n\n"

    puts "Due Today\n"
    due_today_list = all.where(due_date: today)
    due_today_list_displayable = due_today_list.to_displayable_list
    puts due_today_list_displayable
    puts "\n\n"

    puts "Due Later\n"
    due_later_list = all.where("due_date > 'today'")
    due_later_list_displayable = due_later_list.to_displayable_list
    puts due_later_list_displayable
    puts "\n\n"
  end

  def self.add_task(todo)
    todo_text = todo[:todo_text]
    due_date = Date.today + todo[:due_in_days]
    create!(todo_text: todo_text, due_date: due_date, completed: false)
  end

  def self.mark_as_complete(todo_id)
    todo_for_completion = find(todo_id)
    todo_for_completion.completed = true
    todo_for_completion.save
    return todo_for_completion
  end
end

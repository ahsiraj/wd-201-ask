require "active_record"
require "./connect_db.rb"

class Todo < ActiveRecord::Base

  #=begin

  def due_today?
    due_date == Date.today
  end

  def over_due?
    due_date < Date.today && !completed
  end

  def due_later?
    due_date > Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.status
    today = Date.today
    puts today
    if due_date < today && !completed then status = "Overdue" elsif due_date == today then status = "Due Today" else status = "Due Later" end
  end

  #=end
  def self.show_list
    display_list = to_displayable_list
    puts "My Todo-list\n\n"
    puts display_list

    puts "Overdue\n"
    all.map { |todo| puts todo.over_due? ? "#{todo.id}. #{display_list[todo.id]}" : nil }

    puts "\n\n"

    puts "Due Today\n"
    all.map { |todo| puts todo.due_today? ? "#{todo.id}. #{display_list[todo.id]}" : nil }
    puts "\n\n"

    puts "Due Later\n"
    all.map { |todo| puts todo.due_later? ? "#{todo.id}. #{display_list[todo.id]}" : nil }
    puts "\n\n"
  end

  def self.add_task(todo_text, due_in_days)
  end

  def mark_as_complete
  end
end

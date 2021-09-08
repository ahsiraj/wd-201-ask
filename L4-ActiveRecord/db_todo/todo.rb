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
    "#{id}. #{display_status} #{todo_text} #{display_date}"
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

  def self.add_task(todo_text, due_in_days)
  end

  def mark_as_complete
  end
end

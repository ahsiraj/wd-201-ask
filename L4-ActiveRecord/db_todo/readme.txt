systemctl status postgresql.service
sudo systemctl start postgresql

irb
require './connect_db.rb'
require './todo.rb'
connect_db!
Todo.all
Todo.where(completed: false)
Todo.where("completed = ? and due_date > ?", false, Date.parse("2021-09-06"))

Todo.all[0].id
Todo.find(1)


todo = Todo.first
todo.todo_text
todo.todo_text = "Buy groceries and fruits"
todo.save

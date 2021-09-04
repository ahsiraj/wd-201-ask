class Student
  def initialize(roll_no, name)
    @roll_no = roll_no
    @name = name
    @is_enrolled = false
  end

  # Setter
  def enroll
    @is_enrolled = true
  end

  # Getter
  def is_enrolled?
    @is_enrolled
  end

  # Getter
  def name
    @name
  end

  # Getter
  def roll_no
    @roll_no
  end
end

enrolled_student = Student.new(715, "Raj")
enrolled_student.enroll
puts enrolled_student.roll_no, enrolled_student.name, enrolled_student.is_enrolled?

#Salutation

class Person
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  # A getter method with domain logic
  def full_name_greeting
    "Hello, #{@first_name} #{@last_name}"
  end
end

bava = Person.new("Ahammed", "Siraj")
puts bava.full_name_greeting

#Another example--- Tell don't Ask!
class Course
  def initialize(name, students)
    @name = name
    @students = students
  end

  def add_student(student)
    @students.push(student)
  end
end

c = Course.new("SaaS", ["A", "B"])
c.add_student("X")
c.add_student("Y")

#More ================= Object composition
class Course
  def initialize(name, students)
    @name = name
    @students = students
  end

  # Add more students even after the object is initialized.
  def enroll(new_student)
    @students.push(new_student)
  end

  def is_student_enrolled?(roll_no)
    @students.any? { |student| student.roll_no == roll_no }
  end

  def get_student(roll_no)
    @students.find { |student| student.roll_no == roll_no }
  end
end

saas = Course.new("SaaS 201", [
  Student.new(715, "Raj"),
  Student.new(716, "Sai"),
])

puts saas.is_student_enrolled?(715)   # true
puts saas.is_student_enrolled?(800)   # false
saas.enroll(Student.new(800, "Ned"))
puts saas.is_student_enrolled?(800)   # true
puts saas.get_student(800).name       # Ned

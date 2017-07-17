
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]}"
    puts "Born: #{students[i][:birthplace]}, Height: #{students[i][:height]}, Hobby: #{students[i][:hobby]} -  #{students[i][:cohort]} Cohort"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  students = []
  puts "Please enter the names of the students."
  puts "To finish, input no name."
  name = gets.chomp.capitalize

  while !name.empty? do
    puts "Hobby?"
    hobby = gets.chomp.capitalize
    puts "Birthplace?"
    birthplace = gets.chomp.capitalize
    puts "Height?"
    height = gets.chomp.capitalize
    students << {name: name, hobby: hobby, birthplace: birthplace, height: height, cohort: :November}
    puts "Now we have #{students.count} students. Please input another."
    name = gets.chomp.capitalize
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)

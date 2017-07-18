
def print_header
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i + 1}. #{students[i][:name]}".center(60)
    puts "Born: #{students[i][:birthplace]}, Height: #{students[i][:height]}, Hobby: #{students[i][:hobby]} -  #{students[i][:cohort]}Cohort".center(60)
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(60)
end

def input_students
  students = []
  puts "Please enter the name of the student and cohort month.".center(60)
  puts "For example: 'John Smith, November'".center(60)
  puts "To finish, input no name.".center(60)

  entry = gets.split
  cohort = entry.pop.capitalize
  name = entry.map(&:capitalize).join(" ")

  while !name.empty? do
    puts "Hobby?".center(60)
    hobby = gets.chomp.capitalize
    puts "Birthplace?".center(60)
    birthplace = gets.chomp.capitalize
    puts "Height?".center(60)
    height = gets.chomp.capitalize
    students << {name: name, hobby: hobby, birthplace: birthplace, height: height, cohort: cohort}
    puts "Now we have #{students.count} students. Please input another.".center(60)
    name = gets.chomp.capitalize
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)

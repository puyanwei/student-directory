

def print_header
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print(students)
  students.sort_by {|x| x[:cohort]}.select {|x| puts "#{x[:cohort]} - #{x[:name]}"}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(60)
end

def input_students
  month = %w(January February March April May June July August September October November December)
  students = []
  puts "Please enter the name of the student".center(60)
  puts "To finish, input no name.".center(60)
  name = gets.chomp.capitalize

  while !name.empty? do
  puts "Month of cohort. Default is November if blank".center(60)
  loop do
    cohort = gets.chomp.capitalize
    if cohort.empty?
      @cohort = :November
      break
    end
    if month.include?(cohort)
      @cohort = cohort.to_sym
      break
    end
    puts "Invalid month. Try again.".center(60)
  end

    puts "Hobby?".center(60)
    hobby = gets.chomp.capitalize
    puts "Birthplace?".center(60)
    birthplace = gets.chomp.capitalize
    puts "Height?".center(60)
    height = gets.chomp.capitalize
    students << {name: name, hobby: hobby, birthplace: birthplace, height: height, cohort: @cohort}
    puts "Now we have #{students.count} students. Please input another.".center(60)
    name = gets.chomp.capitalize
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)

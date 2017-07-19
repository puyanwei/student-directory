
def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "Invalid Choice. Try again."
    end
  end
end

def print_header
  puts "The Students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print(students)
  if @n == 0
     return
  end

  students.sort_by {|x| x[:cohort]}.select {|x| puts "#{x[:cohort]} - #{x[:name]}"}
end

def print_footer(names)
  if @n == 0
     return
  puts "Overall, we have #{@n} great #{plural @n}".center(60)
  end
end

def input_students
  month = %w(January February March April May June July August September October November December)
  puts "Please enter the name of the student".center(60)
  puts "To finish, input no name.".center(60)
  name = gets.gsub(/\n/,"").capitalize

  while !name.empty? do
  puts "Month of cohort. Default is November if blank".center(60)
  loop do
    cohort = gets.gsub(/\n/,"").capitalize
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
    hobby = gets.gsub(/\n/,"").capitalize
    puts "Birthplace?".center(60)
    birthplace = gets.gsub(/\n/,"").capitalize
    puts "Height?".center(60)
    height = gets.gsub(/\n/,"").capitalize
    students << {name: name, hobby: hobby, birthplace: birthplace, height: height, cohort: @cohort}
    @n = students.count
    puts "Now we have #{@n} #{plural @n}. Please input another.".center(60)
    name = gets.gsub(/\n/,"").capitalize
  end
  students
end

def plural(n)
 n == 1? "student" : "students"
end

print_header
<<<<<<< HEAD
interactive_menu
=======
students = input_students
print(students)
print_footer(students)
>>>>>>> 8abdb26ffb846586e4970322362f35fe8279e6ca

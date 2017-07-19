@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "Invalid Selection. Try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The Students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print_student_list
  @students.sort_by {|x| x[:cohort]}.select {|x| puts "#{x[:cohort]} - #{x[:name]}"}
end

def print_footer
  puts "Overall, we have #{@n} great #{plural}".center(60)
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
    @students << {name: name, hobby: hobby, birthplace: birthplace, height: height, cohort: @cohort}
    @n = @students.count
    puts "Now we have #{@n} #{plural}. Please input another.".center(60)
    name = gets.gsub(/\n/,"").capitalize
  end
end

def plural
 @n == 1? "student" : "students"
end

interactive_menu

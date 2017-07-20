@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      puts "Input students selected".center(60)
      input_students
    when "2"
      puts "Show students selected"
      show_students
    when "3"
      puts "Save students selected".center(60)
      save_students
    when "4"
      puts "Load students selected".center(60)
      load_students
    when "9"
      puts "Exit selected".center(60)
      exit
    else
      puts "Invalid Selection. Try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load a file"
  puts "9. Exit"
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
  @students.sort_by {|x| x[:cohort]}.select {|x| puts "#{x[:name]} - #{x[:cohort]}"}
end

def print_footer
  puts "Overall, we have #{@n} great #{plural}".center(60)
end

def input_students
  month = %w(January February March April May June July August September October November December)
  puts "Please enter the name of the student".center(60)
  puts "To finish, input no name.".center(60)
  @name = STDIN.gets.gsub(/\n/,"").capitalize

  while !@name.empty? do
  puts "Month of cohort. Default is November if blank".center(60)
    loop do
      @cohort = STDIN.gets.gsub(/\n/,"").capitalize
      if @cohort.empty?
        @cohort = :November
        break
      end
      if month.include?(@cohort)
        @cohort = @cohort.to_sym
        break
      end
      puts "Invalid month. Try again.".center(60)
    end
    add_to_array
    puts "Now we have #{@students.count} #{plural}. Please input  another.".center(60)
    @name = STDIN.gets.gsub(/\n/,"").capitalize
  end
end

def save_students
  puts "Please input the name of your file to save"
  input = gets.chomp
  file = File.open("#{input}.csv", "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "File #{input}.csv is saved.".center(60)
end

def load_students
  puts "Please input the exact name of the file".center(60)
  input = gets.chomp
  file = File.open(input, "r") do |file|
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(',')
    end
  end
  add_to_array
  puts "students.csv loaded.".center(60)
end

def try_load_students
  if ARGV.empty?
      filename = "students.csv"
    else
      filename = ARGV.first
    end
    puts "Loaded #{@students.count} from #{filename}".center(60)
end

def plural
 @n == 1? "student" : "students"
end

def add_to_array
@students << {name: @name, cohort: @cohort}
end

try_load_students
interactive_menu

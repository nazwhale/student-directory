def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get first name
  name = gets.gsub("\n","")
  cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  #while name is not empty, repeat this code
  while !name.empty? do
    #add student hash to array
    puts "Enter cohort month"
    puts "To use default value, just hit return"
    cohort = gets.gsub("\n","")
    cohort = cohort.capitalize
    #set default value
    if cohort == ""
      cohort = "November"
      puts "No month entered. Cohort set to default month (November)"
    end
    #check for typos
    until cohorts.include? cohort
      puts "Value entered is not a month"
      puts "Enter cohort month"
      cohort = gets.gsub("\n","")
    end
    #convert cohort input to symbol
    cohort = cohort.to_s
    puts "Enter nationality"
    nat = gets.gsub("\n","").capitalize
    puts "Enter height (cm)"
    height = gets.gsub("\n","")
    students << {name: name, cohort: cohort, nationality: nat, height: height}
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    name = gets.gsub("\n","")
  end
  #return array of students
  students
end

def print_header
  lineWidth = 50
  puts "The students of Villains Academy".center(lineWidth)
  puts "-------------".center(lineWidth)
end

def print(students)
  count = 0
  until count == students.length
    puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort, nationality: #{students[count][:nationality]}, height: #{students[count][:height]}cm)"
    count +=1
  end
end

def print_footer(students)
  lineWidth = 50
  puts "-------------".center(lineWidth)
  if students.count == 1
    puts "Overall, we have 1 great student".center(lineWidth)
  else
    puts "Overall, we have #{students.count} great students".center(lineWidth)
  end
end

def first_letter(students)
  puts "Select first letter to sort students by:"
  letter = gets.gsub("\n","")
  puts "Students whos name begins with '#{letter}':"
  count = 1
  students.each do |s|
    if s[:name][0] == letter
      puts "#{count}. #{s[:name]} (#{s[:cohort]} cohort)"
      count +=1
    end
  end
end

def shortys(students)
  puts "Students with short names:"
  count = 1
  students.each do |s|
    if s[:name].gsub(" ","").length < 12
      puts "#{count}. #{s[:name]} (#{s[:cohort]} cohort)"
      count +=1
    end
  end
end

def print_by_cohorts(students)
  #get list of existing cohorts
  months = []
  students.each { |student| months << student[:cohort] }
  months = months.uniq
  #iterate over it and only print the students from that cohort.
  months.each do |cohort|
    puts "#{cohort}:"
    students.each {|student| puts student[:name] if student[:cohort] == cohort}
  end
end


students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_by_cohorts(students)
print_footer(students)

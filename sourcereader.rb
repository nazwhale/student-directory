#Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.
File.open($0, "r") {|l| puts l.read}

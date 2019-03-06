#!/usr/bin/env ruby

directory = %(#{ENV["HOME"]}/.q/)
file = "#{directory}queue.txt"
unless File.exists? file
	unless Dir.exists? directory
		Dir.mkdir(directory)
	end
	File.write(file, "")
end

if ARGV.empty?
	queue = File.readlines(file).map &:strip
	if queue.empty?
		puts "Nothing in your q!"
	else
		puts queue[0]
		if queue.length > 1
			File.write(file, queue[1..].join("\n"))
		else
			File.write(file, "")
		end
	end
else
	File.open(file, 'a') { |f| f.write("#{ARGV[0]}\n") }
end
	
	

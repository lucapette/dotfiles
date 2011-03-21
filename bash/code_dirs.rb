#!/usr/bin/ruby 

Dir["#{File.expand_path("~/code")}/*"].each { |file|
    puts "alias #{File.basename(file)}=\"cd #{file}\""
}

require 'rake'
require 'find'
require 'pathname'

IGNORE_FILES = [/^\.gitignore$/, /^Rakefile$/,/^README.textile$/]

files = `git ls-files`.split("\n")
files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }


desc 'Installs dotfiles'
task :install do
  targetdir=File.expand_path("~")
  files.each do |file|
    target_file = File.join(targetdir, ".#{file}")
    FileUtils.mkdir_p File.dirname(target_file)
    FileUtils.cp file, target_file

    puts "Installed #{file} to #{target_file}"
  end

end

desc 'Pulls from origin'
task :pull do
  puts "Updating from git repo"
  system("cd " << Dir.new(File.dirname(__FILE__)).path << " && git pull")
end

desc 'Updates from git repo and then update files in dir'
task :update => ['pull', 'install'] do
  puts "Update of vim script complete."
end

task :default => ['update']

require 'rake'
require 'find'
require 'pathname'

IGNORE_FILES = [/^\.gitignore$/, /^Rakefile$/,/^README.textile$/]

files = `git ls-files`.split("\n")
files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }

desc 'installs dotfiles in home dir'
task :install do
    targetdir=File.expand_path("~")
    files.each do |file|
        if File.exists?(file)
            target_file = File.join(targetdir, ".#{file}")
            FileUtils.mkdir_p File.dirname(target_file)
            FileUtils.cp file, target_file

            puts "Installed #{file} to #{target_file}"
        else
            puts "#{file} removed?"
        end
    end

end

desc 'pulls from git repository'
task :pull do
    puts "Updating from git repository"
    system("cd " << Dir.new(File.dirname(__FILE__)).path << " && git pull")
end

desc 'updates from git repository and then updates files in dir'
task :update => ['pull', 'install'] do
    puts "Update of dotfiles completed."
end

task :default => ['install']

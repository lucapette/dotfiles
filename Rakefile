require 'pathname'

IGNORE_FILES = [/^bin/,/^\.git.*$/, /^Rakefile$/,/^README.md$/, /^LICENSE/]

files = `git ls-files -co --exclude-standard`.split("\n")

files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }

target_dir = File.expand_path('~')

desc 'installs dotfiles in home dir'
task :install do
  files.each do |file|
    next unless File.exist?(file)

    target_file = File.join(target_dir, ".#{file}")
    parent_dir = File.dirname(target_file)
    if File.exist?(parent_dir) && !File.directory?(parent_dir)
      FileUtils.rm parent_dir
    end
    FileUtils.mkdir_p parent_dir
    FileUtils.cp file, target_file

    puts "Installed #{file} to #{target_file}"
  end

  Dir['bin/**/*'].each do |file|
    next if File.directory?(file)
    target_file = File.join(target_dir, 'bin', file.sub(/^bin\//, ''))
    parent_dir = File.dirname(target_file)
    if File.exist?(parent_dir) && !File.directory?(parent_dir)
      FileUtils.rm parent_dir
    end
    FileUtils.mkdir_p parent_dir
    FileUtils.cp file, target_file, preserve: true
    puts "Installed #{file} to #{target_file}"
  end
end

task default: ['install']

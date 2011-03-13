class CodePath

    VERSION='0.0.2'

    def initialize(code_dir)
        @code_dir = code_dir
    end

    def codedir(current_dir)
        if codedir?(current_dir)
            current_dir[/#{@code_dir}/]=""
            "#{@code_dir}/#{current_dir.match(/^\/([^\/]+)/)[1]}"
        else
            current_dir
        end
    end

    def subdirs(path)
        Dir.glob(File.join(path,"**/*")).select { |f| File.directory?(f) }
    end  

    def codedir?(current_dir)
        current_dir.include?(@code_dir)
    end

end

module Git4j

  class Repo
    
    attr_accessor :path
    attr_accessor :working_dir
    attr_reader :bare
    
    def initialize(path, options = {})
      
      epath = File.expand_path(path)

      if File.exist?(File.join(epath, '.git'))
        self.working_dir = epath
        self.path = File.join(epath, '.git')
        @bare = false
      elsif File.exist?(epath) && (epath =~ /\.git$/ || options[:is_bare])
        self.path = epath
        @bare = true
      elsif File.exist?(epath)
        raise InvalidGitRepositoryError.new(epath)
      else
        raise NoSuchPathError.new(epath)
      end
      
    end
    
  end

end
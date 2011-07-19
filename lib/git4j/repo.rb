module Git4j
    
  class Repo
  
    attr_accessor :git
    attr_accessor :path
    attr_accessor :working_dir
    attr_reader :bare
    
    def initialize(path, options = {})
      epath = File.expand_path(path)
      if File.exist?(File.join(epath, '/.git'))
        @working_dir = epath
        @path = File.join(epath, '/.git')
        @bare = false
      elsif File.exist?(epath) || options[:is_bare]
        @path = File.join(epath, '/.git')
        @bare = true
      end
      
      @git = RubyGit.new(@path)
      
    end
  
    def commits
      @git.log
    end
  
  end

end
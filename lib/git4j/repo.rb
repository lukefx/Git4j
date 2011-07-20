module Git4j

  import org.eclipse.jgit.lib.Repository
  import org.eclipse.jgit.lib.RepositoryBuilder
  
  class Repo
  
    attr_accessor :git
    attr_accessor :repo
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
      
      repo_path = java.io.File.new(@path)
      @repo = RepositoryBuilder.new().set_git_dir(repo_path).build()
      @git = RubyGit.new(@repo)
      
    end
  
    def self.init(path, options = {})
      git_options = {:bare => false}.merge(options)
      repo_path = java.io.File.new(path)
      repository = RepositoryBuilder.new().set_git_dir(repo_path).build()
      repository.create(git_options[:bare])
    end
  
    def commits(ref="master", limit=100)
      options = { :limit => limit }
      Commit.find_all(@repo, ref, options)
    end
  
    def branch
      @repo.get_branch
    end
  
  end

end
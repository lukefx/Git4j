module Git4j

  import org.eclipse.jgit.api.Git
  import org.eclipse.jgit.lib.Repository
  import org.eclipse.jgit.lib.RepositoryBuilder

  class RubyGit
  
    attr_accessor :git
  
    def initialize(path)
      repo_path = java.io.File.new(path)
      repository = RepositoryBuilder.new().set_git_dir(repo_path).build()
      @git = Git.new(repository)
    end
  
    def log
      logs = @git.log
      commits = Array.new
      logs.call.each do |commit|
        commits << Commit.new(commit)
      end
      commits
    end
  
    def branch_list
      branch = @git.branch_list
      array = Array.new
      branch.call.each do |b|
        array << b.get_name
      end
      array
    end
  
  end

end
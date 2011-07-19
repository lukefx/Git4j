module Git4j

  import org.eclipse.jgit.revwalk.RevCommit

  class Commit

    attr_reader :id
    attr_reader :repo
    attr_reader :parents
    attr_reader :tree
    attr_reader :author
    attr_reader :authored_date
    attr_reader :committer
    attr_reader :committed_date
    attr_reader :message
    attr_reader :short_message
  
    def initialize(commit)
      # @repo = repo
      @id = commit.get_id
      # @parents = parents.map { |p| Commit.create(repo, :id => p) }
      # @tree = Tree.create(repo, :id => tree)
      @author = commit.author_ident
      # @authored_date = authored_date
      # @committer = committer
      @committed_date = Time.at(commit.commit_time)
      @message = commit.full_message
      @short_message = commit.full_message.split("\n").select { |x| !x.strip.empty? }[0] || ''
    end
  
    
  
  end

end
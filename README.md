Git4j
====

Git4j gives you object oriented read/write access to Git repositories via JRuby.
The interactions with Git repositories are done with JGit.

### Initialize a Repo object

The first step is to create a `git4j::Repo` object to represent your repo. In
this documentation I include the `Git4j` module to reduce typing.

    require 'Git4j'
    repo = Git4j::Repo.new("/Users/lukefx/jruby")

In the above example, the directory `/Users/lukefx/jruby` is my working
directory and contains the `.git` directory. You can also initialize Grit with
a bare repo.

    repo = Repo.new("/var/git/grit.git")


### Getting a list of commits

From the `Repo` object, you can get a list of commits as an array of `Commit`
objects.

    repo.commits
    # => [#<Git4j::Commit "e80bbd2ce67651aa18e57fb0b43618ad4baf7750">,
          #<Git4j::Commit "91169e1f5fa4de2eaea3f176461f5dc784796769">,
          #<Git4j::Commit "038af8c329ef7c1bae4568b98bd5c58510465493">,
          #<Git4j::Commit "40d3057d09a7a4d61059bca9dca5ae698de58cbe">,
          #<Git4j::Commit "4ea50f4754937bf19461af58ce3b3d24c77311d9">]
          

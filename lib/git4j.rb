$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

require 'logger'

# internal requires
require 'git4j/git'
require 'git4j/repo'
require 'git4j/version'

module Git4j

  begin
    require 'java'
    Dir["#{File.dirname(__FILE__)}/jars/*.jar"].each { |jar| require jar }
  rescue LoadError
    puts "You need to be running JRuby to use this gem."
    raise
  end

  @logger ||= ::Logger.new(STDOUT)
  
  def self.version
    VERSION
  end
  
end


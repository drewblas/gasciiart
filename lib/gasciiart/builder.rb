require 'fileutils'

class Gasciiart::Builder
  attr_reader :source, :target, :options

  def initialize(source, target, options = {})
    @source, @target, @options = source, target, options
    @source = "#{@source}/" unless @source[-1..-1] == '/'
    @target = "#{@target}/" unless @target[-1..-1] == '/'
    @verbose = options[:verbose]

    @starting_dir = Dir.pwd
    @target_animation = "#{@target}animation.txt"
  end

  # Where all the magic happens
  # Setups up the output and loops through each file from the source (in `ls` order)
  # Creating a commit for each file
  def build!
    test_git!

    file_list = Dir.glob("#{@source}*").sort # Pull the file list before creating the target directory

    setup_target

    add_runner

    file_list.each do |infile_name|
      rewrite_animation_frame infile_name
      create_commit infile_name
    end
  end

  # Creates and git inits the target directory
  def setup_target
    log "Setting up #{@target}"

    if File.exists? @target
      raise ArgumentError, %{Target directory "#{@target}" already exists}
    end

    FileUtils.mkdir @target

    run "git init ."

    # TODO: Create runner file
  end

  def rewrite_animation_frame(infile_name)
    log "Writing #{infile_name}"
    File.open(infile_name) do |infile|
      File.open(@target_animation, 'w') do |outfile|
        outfile.write infile.read  # This could be streamed, but a single animation frame is small enough.  Let's start simple
      end
    end
  end

  def create_commit(infile_name)
    run %{git add animation.txt && git commit -m "#{infile_name}"}
  end

  def add_runner
    filename = "#{@target}run.sh"
    File.open(filename, 'w') do |f|
      f.write Gasciiart::RUNNER
    end

    File.chmod 0755, filename

    run %{git add run.sh && git commit -m "Added run.sh"}
  end

  protected

  # Log the message if verbose is on
  def log(msg)
    puts msg if @verbose
  end

  # Ensures there is the git command available
  # TODO: Test git version
  def test_git!
    result = `which git`
    if $?.exitstatus != 0
      raise IOError, "Can't find git"
    end
  end

  # Runs the specified command
  #
  # All run commands happen in the target dir
  # but all file paths are relative to the starting directory, so all the switching happens here
  def run(cmd)
    Dir.chdir @target

    log "Running: #{cmd}"
    `#{cmd}`
    if $?.exitstatus != 0
      raise IOError, %{Error executing command: "#{cmd}"}
    end

    Dir.chdir @starting_dir
  end
end

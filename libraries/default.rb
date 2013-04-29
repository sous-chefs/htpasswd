def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = "#{path}/#{cmd}#{ext}"
      return exe if File.executable? exe
    }
  end
  return nil
end

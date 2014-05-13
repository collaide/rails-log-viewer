require "log/parser/version"
require 'net/scp'

module Log
  module Parser
    def self.create_log_file
      dir = File.join(Dir.home, '.log-parser')
      Dir.mkdir(dir) unless Dir.exist?(dir)
      File.open(File.join(dir, 'logstash.log'), 'a+').close unless File.exists? File.join(dir, 'logstash.log')
    end
    def self.fetch_log(server, remote_path, user_name, password)
      dir = File.join(Dir.home, '.log-parser')
      log = File.join(dir, 'tmp.log')
      Dir.mkdir(dir) unless Dir.exist?(dir)
      Net::SCP::download!(server, user_name, remote_path, log)
      puts 'reading log...'
      file_line_path = File.join(dir, '.line')
      if File.exists? file_line_path
        line_nb =  IO.read(file_line_path).to_i
      else
        line_nb = nil
      end
      file = File.open(log, 'r')
      count = 0
      log_file = File.open(File.join(dir, 'logstash.log'), 'a+')
      while !file.eof?
        count+=1
        line = file.readline
        if line_nb.nil? or line_nb < count
          log_file.write(line)
        end
      end
      log_file.close
      file_line = File.new(file_line_path, 'w+')
      file_line.write(count.to_s+'\n')
      file_line.close
      file.close
    end
  end
end

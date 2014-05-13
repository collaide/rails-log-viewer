# Rails Log viewer

With the help of logstash, elasticsearch, kibana and lograge, it is now realy easy to view log of a rails app locally.

This solution has the adventage that it doesn't require any remote server to run.

What it does is to fetch the remote logs to your locale machine and start logstash with kibana if needed



## Installation

Install the gem:

    $ gem install rails-log-viewer
    
Install logstash:

1. Download the latest logstash
2. uncompress the archive

## Usage

#### Configure

First, start to configure the gem, run:

     $ fetch-log config
     
And provide the required informations. By now, you need to setup a ssh publickey to access to your remote machine. The password option is not working. Then, run:

    $ read-log config
    
And provide your logstash executable (usually under: `logstash-1.x.x/bin/logstash`)

Now you can run logstash: ` read-log ` and then fetch the log: ` fetch-log `. Each times the logs has changed and you want to read it, run. ` fetch-log `.

Go to ` localhost:9292 ` to view your logs !

When you are done, run: ` read-log quit `

If you delete the log file to the server and want to parse it from the beginning, run: `read-log reset`

Every created files by this gem are under `$HOME/.log-parser`. Config files are .config for server access and .config-read for logstash executable

To configure lograge go to his github repo. Otherwise is a good idea to read the logstash doc!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

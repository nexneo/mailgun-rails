require 'rake'
require 'rubygems/package_task'

begin
  require 'jeweler'

  Jeweler::Tasks.new do |jewel|
    jewel.name        = 'mailgun-rails'
    jewel.summary     = 'Mailgun adapter for ActionMailer'
    jewel.email       = ['niket@insightmethods.com']
    jewel.homepage    = 'https://github.com/nexneo/mailgun-rails'
    jewel.description = 'Use this plugin in your rails applications to send emails through the mailgun http mime API'
    jewel.authors     = ["Niket Patel"]
    jewel.files       = FileList["lib/mailgun-rails.rb", "MIT-LICENCE", "README.markdown"]

    jewel.add_dependency 'curb'
    jewel.add_dependency 'activesupport'
    jewel.add_dependency 'actionmailer'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
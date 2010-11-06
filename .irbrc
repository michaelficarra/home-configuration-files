require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize

%w{irb/completion irb/ext/save-history pp rubygems}.map {|f| require f}

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb.history"

class Object
	def local_methods(obj = self)
		(obj.methods - (obj.class.superclass || Object).instance_methods).sort
	end
end

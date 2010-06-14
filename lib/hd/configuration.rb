module ActionController #:nodoc: 
	module HandsetDetection
	class HandsetDetectionConfigFileNotFoundException < StandardError
	end		
	
	# Class fo the manipulation of the API key
	class Configuration
		
		@@other_options = {'vendors' => '/devices/vendors.xml',
		                   'models' => '/devices/models.xml',
		                   'detect' => '/devices/detect.xml',
		                   'track' => '/devices/track.xml'
		                   }
		
		# Read the API key config for the current ENV
		unless File.exist?(RAILS_ROOT + '/config/handset_detection.yml')
			raise HandsetDetectionConfigFileNotFoundException.new("File RAILS_ROOT/config/handset_detection.yml not found")
		else
			env = ENV['RAILS_ENV'] || RAILS_ENV
			HANDSET_DETECTION_CONFIG = YAML.load_file(RAILS_ROOT + '/config/handset_detection.yml')[env]
			@@other_options.each { | key, value |
				HANDSET_DETECTION_CONFIG[key] = value
			}
		end
		
		def self.get(option)
			HANDSET_DETECTION_CONFIG[option]
		end
	end
	end
end

# extend string class
class String

  # Returns a random String of a given +length+.
  def self.random(length = 100)
    (0...length).map { ("a".."z").to_a[rand(26)] }.join
  end

end

# extend Time class
class Time
	
	# Ruby version of PHP microtime
	def self.microtime
		epoch_mirco = Time.now.to_f
		epoch_full = Time.now.to_i
		epoch_fraction = epoch_mirco - epoch_full
		epoch_fraction.to_s + ' ' + epoch_full.to_s
	end
	
end
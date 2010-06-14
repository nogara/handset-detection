# Include hook code here
require File.dirname(__FILE__) + '/lib/handset_detection' 

#copy the config file
handset_detection_config = File.dirname(__FILE__) + '/../../../config/handset_detection.yml'
unless File.exist?(handset_detection_config)
  FileUtils.copy(File.dirname(__FILE__) + '/handset_detection.yml.sample', handset_detection_config)
end


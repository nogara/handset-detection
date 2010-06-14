# Handset Detection

Rails plugin to deal with contacting the really useful handsetdetection.com web service.

Before contacting the web service to get detailed information about the device connecting to your site, it
does a simplified check against user-agent and accept strings to see if the device is a mobile, or not.  If not
it forgoes the check to the webservice (but you can override this).

## handsetdetection.com

There's tens of thousands of mobile phones out there, all slightly different, which makes working with mobile technologies tricky and time consuming. So, we created Handset Detection. A real time, self updating, database of thousands of mobile phones.

* massive database of over 25000 mobile devices (and growing daily) means we've got you covered. 
* Never be out of date! Handset Detection is updating itself with new handsets all the time
* Know where your users are from! (Carrier, Country, City, Region, Longitude, Latitude). 
* Handset Detection Analytics is purpose built to grind your detection and redirection information into a smooth flow of mobile analytics insight. 

## Install

	script/plugin install git://github.com/wooki/handset_detection.git

Simple.

## Usage

The bets place to use the library is part of a before_filter within your application controller. Then either check on every request, or just the first request of a session.

	class ApplicationController < ActionController::Base
		handset_detection

	end

Detecting the device is one simple call.

	def detect(user_agent, accept, force=false, options="geoip, product_info, display")

For example:
	
	@device_detect = detect(request.user_agent, request.accept, false, "product_info, display")

The function returns a hash containing two indexes.
	
	@device_detect[:device] # simplified name of the device: one of "mobile", "iphone", "windows mobile", "android", "opera mini", "blackberry", "palm", "desktop"
	
	@device_detect[:profile] # XML string returned by the handsetdetection.com service

## License

Copyright (c) 2010 James Rowe, released under The MIT License


		
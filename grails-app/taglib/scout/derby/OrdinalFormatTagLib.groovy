package scout.derby

class OrdinalFormatTagLib {
	
	def ordinalFormat = {attrs, body ->
		def value = attrs.value
		def output = value
		def teens = [11, 12, 13]
		if(teens.contains(value)){
		  output =  value + 'th'
		}else{
			def modValue = value % 10
			def th = [0,4,5,6,7,8,9]
			def st = [1]
			def nd = [2]
			def rd = [3]
			if(th.contains(modValue)){
				output =  value + "th"
			}
			if(st.contains(modValue)){
			   output =  value + "st"
			}
			if(nd.contains(modValue)){
			   output =  value + "nd"
			}
			if(rd.contains(modValue)){
			   output =  value + "rd"
			}
		}
		out << output
	}

}

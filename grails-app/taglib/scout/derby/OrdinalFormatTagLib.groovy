package scout.derby

class OrdinalFormatTagLib {
	
	def ordinalFormat = {attrs, body ->
		def value = attrs.int('value')
		def output = value
		def stringValue = '' + value
		def lastDigits = stringValue[(stringValue.size()-2)..(stringValue.size()-1)]
		def teens = ['11', '12', '13']
		if(teens.contains(lastDigits)){
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

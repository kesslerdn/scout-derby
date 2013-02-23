package com.sourceallies

class DonateController {

	private static final int RESULT_SIZE = 10
	
    def index = {
        render(view: "intro")
    }
	
    def cancel = {
        redirect(uri:"/")
    }
	
	
	def thankyou = {
	}

 }

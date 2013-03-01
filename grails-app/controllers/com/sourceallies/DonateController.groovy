package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
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

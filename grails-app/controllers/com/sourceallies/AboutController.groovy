package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class AboutController {
	
    def index = {
        render(view: "index")
    }

 }

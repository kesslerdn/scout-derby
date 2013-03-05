package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class ManageDerbyController {

    def index = {
       render(view: "menu")
    }

    def advanced = {
       render(view: "advanced")
    }
}

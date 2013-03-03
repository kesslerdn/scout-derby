package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class ManagerController {

    def index = {
       render(view: "menu")
    }
}

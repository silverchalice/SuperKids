package com.superkids

class HomeController {

    def index = {
		render view:'home'
	}


	def ultragrain = {
		render view:'ultragrain'
	}

	def sustagrain = {
		render view:'sustagrain'
	}
}

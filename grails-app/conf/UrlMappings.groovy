class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"home", action:"index")
		"/admin" {
                    controller = "customer"
                    action = "list"
                }
                "/login/" {
                    controller = "login"
                    action = "auth"
                }
                "/broker/" {
                    controller = "home"
                    action = "broker"
                }
                "/public/" {
                    controller = "home"
                    action = "anonymous"
                }
		"500"(view:'/error')
	}
}

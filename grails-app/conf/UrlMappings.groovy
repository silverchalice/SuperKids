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
		"500"(view:'/error')
	}
}

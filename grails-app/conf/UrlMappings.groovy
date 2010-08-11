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
                "/home/register/" {
                    controller = "customer"
                    action = "create"
                }
		"500"(view:'/error')
	}
}

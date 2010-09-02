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
                "/register/" {
                    controller = "home"
                    action = "register"
                }
                "/edit_profile/" {
                    controller = "home"
                    action = "edit_profile"
                }
                "/broker/" {
                    controller = "home"
                    action = "broker"
                }
                "/broker-products/" {
                    controller = "home"
                    action = "broker_products"
                }
                "/broker-whole-grain-benefits/" {
                    controller = "home"
                    action = "broker_whole_grain_benefits"
                }
                "/broker-whole-grain-studies/" {
                    controller = "home"
                    action = "broker_whole_grain_studies"
                }
                "/incorporating-whole-grains-in-schools/" {
                    controller = "home"
                    action = "incorporating_whole_grains_in_schools"
                }
                "/broker-participate/" {
                    controller = "home"
                    action = "broker_participate"
                }
                "/broker-ecard/" {
                    controller = "home"
                    action = "broker_ecard"
                }
                "/learn/" {
                    controller = "home"
                    action = "learn"
                }
                "/order/" {
                    controller = "home"
                    action = "order"
                }
                "/assess/" {
                    controller = "home"
                    action = "assess"
                }
                "/promote/" {
                    controller = "home"
                    action = "promote"
                }
                "/assessment-drawing-rules" {
                    controller = "home"
                    action = "assessment_drawing_rules"
                }
                "/public/" {
                    controller = "home"
                    action = "anonymous"
                }
                "/cart/" {
                    controller = "testShoppingCart"
                    action = "show"
                }
		"500"(view:'/error')
	}
}

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
                "/assessment-tools" {
                    controller = "home"
                    action = "assessment_tools"
                }
                "/ecards" {
                    controller = "home"
                    action = "ecards"
                }
                "/promotion-tools-and-resources" {
                    controller = "home"
                    action = "promotion-tools-and-resources"
                }
                "/additional-promotional-ideas" {
                    controller = "home"
                    action = "additional_promotional_ideas"
                }
                "/what-is/" {
                    controller = "home"
                    action = "what_is"
                }
                "/about/" {
                    controller = "home"
                    action = "about"
                }
                "/superkids-products/" {
                    controller = "home"
                    action = "superkids_products"
                }
                "/testimonials/" {
                    controller = "home"
                    action = "testimonials"
                }
                "/whole-grain-list/" {
                    controller = "home"
                    action = "whole_grain_list"
                }
                "/whole-grain-benefits/" {
                    controller = "home"
                    action = "whole_grain_benefits"
                }
                "/whole-grain-studies/" {
                    controller = "home"
                    action = "whole_grain_studies"
                }
                "/sneaky-chef/" {
                    controller = "home"
                    action = "sneaky_chef"
                }
                "/council-tips/" {
                    controller = "home"
                    action = "council_tips"
                }
                "/sustagrain/" {
                    controller = "home"
                    action = "sustagrain"
                }
                "/ultragrain/" {
                    controller = "home"
                    action = "ultragrain"
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

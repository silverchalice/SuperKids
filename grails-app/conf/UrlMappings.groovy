class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller:"home", action:"index")
        "/admin" {
            controller = "login"
            action = "admin_login"
        }
        "/caller" {
            controller = "login"
            action = "caller_login"
        }
        "/login/" {
            controller = "login"
            action = "auth"
        }
        "/login/auth" {
            controller = "login"
            action = "auth"
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
        "/assess" {
            controller = "home"
            action = "assess"
        }
        "/promote" {
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
            action = "promotion_tools_and_resources"
        }
        "/additional-promotional-ideas" {
            controller = "home"
            action = "additional_promotional_ideas"
        }
        "/testimonials/" {
            controller = "home"
            action = "testimonials"
        }
        "/public/" {
            controller = "home"
            action = "anonymous"
        }
        "/public-products" {
            controller = "home"
            action = "public_products"
        }
        "/public-diets" {
            controller = "home"
            action = "public_diets"
        }
        "/public-diets-students" {
            controller = "home"
            action = "public_diets_students"
        }
        "/public-other-products" {
            controller = "home"
            action = "public_other_products"
        }
        "/public-products" {
            controller = "home"
            action = "public_products"
        }
        "/public-whole-grain-in-schools" {
            controller = "home"
            action = "public_whole_grain_in_schools"
        }
        "/public-whole-grain-studies" {
            controller = "home"
            action = "public_whole_grain_studies"
        }
        "/public-whole-grain-benefits" {
            controller = "home"
            action = "public_whole_grain_benefits"
        }
        //"/cart/" {
        //    controller = "shopping"
        //    action = "index"
        //}
        "/assess/$id" {
            controller = "assessment"
            action = "start"
        }
        //"/change_password/$id" {
        //    controller = "home"
        //    action = "change_password"
        //}
        //"/c_forgot_password" {
        //    controller = "home"
        //    action = "c_forgot_password"
        //}
        //"/c_passwd_reset" {
        //    controller = "home"
        //    action = "c_passwd_reset"
        //}
        //"/c_reset_success" {
        //    controller = "home"
        //    action = "c_reset_success"
        //}
        //"/forgot_password" {
        //    controller = "home"
        //    action = "forgot_password"
        //}
        //"/passwd_reset" {
        //    controller = "home"
        //    action = "passwd_reset"
        //}
        "/contact_requests"{
            controller = "contactRequest"
            action = "list"
        }
        "/contact_requests/$id"{
            controller = "contactRequest"
            action = "show"
        }
        "/contact_requests/edit/$id"{
            controller = "contactRequest"
            action = "edit"
        }
        "/send_message"{
            controller = "contactRequest"
            action = "save"
        }
        "/find_school_district" {
            controller = "customer"
            action = "findSchoolDistrict"
        }
        "/profile_help"{
            controller = "home"
            action = "profile_help"
        }
        "/product/remove"{
            controller = "product"
            action = "remove"
        }
        "/demo"{
            controller = "home"
            action = "demo"
        }
		"500"{
                    controller = "errors"
                    action = "internal_server_error"
                }
	}
}

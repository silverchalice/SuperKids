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
                "/learn.$suffix" {
                    controller = "home"
                    action = "learn"
                    constraints {
                        suffix(matches: 'cfm')
                    }
                }
                "/order.$suffix" {
                    controller = "home"
                    action = "order"
                    constraints {
                        suffix(matches: 'cfm')
                    }
                }
                "/assess.$suffix" {
                    controller = "home"
                    action = "assess"
                    constraints {
                        suffix(matches: 'cfm')
                    }
                }
                "/promote.$suffix" {
                    controller = "home"
                    action = "promote"
                    constraints {
                        suffix(matches: 'cfm')
                    }
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
                    controller = "product"
                    action = "list"
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
                "/childhood_obesity" {
                    controller = "home"
                    action = "childhood_obesity"
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
                "/assess/$id" {
                    controller = "assessment"
                    action = "start"
                }
                "/change_password/$id" {
                    controller = "home"
                    action = "change_password"
                }
                "/contact"{
                    controller = "contactRequest"
                    action = "create"
                }
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
                "/find_school_district" {
                    controller = "customer"
                    action = "findSchoolDistrict"
                }
                "/profile_help"{
                    controller = "home"
                    action = "profile_help"
                }
		"500"{
                    controller = "errors"
                    action = "internal_server_error"
                }
	}
}

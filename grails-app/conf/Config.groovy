import grails.plugins.springsecurity.SecurityConfigType

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = false
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
	xml: ['text/xml', 'application/xml'],
	text: 'text-plain',
	js: 'text/javascript',
	rss: 'application/rss+xml',
	atom: 'application/atom+xml',
	css: 'text/css',
	csv: 'text/csv',
	pdf: 'application/pdf',
	rtf: 'application/rtf',
	excel: 'application/vnd.ms-excel',
	ods: 'application/vnd.oasis.opendocument.spreadsheet',
	all: '*/*',
	json: ['application/json','text/json'],
	form: 'application/x-www-form-urlencoded',
	multipartForm: 'multipart/form-data'
  ]

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.superkidssampling.com"
    }
    development {
        grails.serverURL = "http://localhost:8080/${appName}"
    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}"
    }

}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

grails {
	mail {
	  host = "smtp.gmail.com"
	  port = 465
	  username = "superkidssampling@gmail.com"
	  password = "sksnevergivein89"
	  props = ["mail.smtp.auth":"true",
			   "mail.smtp.socketFactory.port":"465",
			   "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
			   "mail.smtp.socketFactory.fallback":"false"]

	}
}
grails.views.javascript.library="jquery"

grails.plugins.springsecurity.useSecurityEventListener = true

grails.plugins.springsecurity.onInteractiveAuthenticationSuccessEvent = { e, appCtx ->
    def foo = e.getAuthentication()
    com.superkids.domain.User.withTransaction { status ->
        def adminInstance = com.superkids.domain.Admin.findByUsername(foo.principal.username)
        if(adminInstance){
            try {
                adminInstance.attach()
                adminInstance.lastLogin = new Date()
                adminInstance.save(flush: true)
            } catch(org.springframework.dao.OptimisticLockingFailureException up) {
                    adminInstance = Admin.merge(adminInstance)
            }
        }
    }
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.superkids.domain.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.superkids.domain.UserRole'
grails.plugins.springsecurity.authority.className = 'com.superkids.domain.Role'
grails.plugins.springsecurity.requestMap.className = 'com.superkids.domain.Requestmap'
grails.plugins.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap

grails.plugins.springsecurity.interceptUrlMap = [
   '/js/**':                                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/css/**':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/images/**':                                         ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/pdf/**':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/plugins/**':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/uploads/**':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/flash/**':                                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/admin':                                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/product/downloadSummary/**':                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/product/displayImage/**':                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/caller':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/admin/**':                                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/factoid':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/factoid/**':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/data/**':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/':                                                  ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/**':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/product/show/*':                                       ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/order':                                             ['ROLE_USER', 'ROLE_ADMIN'],
   '/order/home':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/order':                                        ['ROLE_USER', 'ROLE_ADMIN'],
   '/home/order/**':                                     ['ROLE_USER', 'ROLE_ADMIN'],
   '/learn':                                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/demo*':                                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/*':                                                 ['ROLE_ADMIN'],
   '/login/**':                                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/logout':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/logout/**':                                         ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/register':                                     ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/register':                                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/enter_site':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/edit_profile':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/shopping/**':                                       ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-products':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-whole-grain-benefits':                       ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-whole-grain-studies':                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/incorporating-whole-grains-in-schools':             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-participate':                                ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-ecard':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/learn/*':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/assess':                                            ['ROLE_USER', 'ROLE_ADMIN'],
   '/promote':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/contact/*':                                         ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/contactRequest/**':                                 ['IS_AUTHENTICATED_ANONYMOUSLY'], 
   '/contact':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/contactRequest/':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'], 
   '/assessment-drawing-rules':                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/assessment-tools':                                  ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/ecards':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/promotion-tools-and-resources':                     ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/additional-promotional-ideas':                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/what-is':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/ultragrain':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/sustagrain':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/product/list':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/testimonials':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/about':                                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/ultragrain-general':                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/sustagrain-general':                                ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/about-manufacturers':                               ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/where-to-find':                                     ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/whole-grain-list':                                  ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/whole-grain-benefits':                              ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/whole-grain-studies':                               ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/childhood-obesity':                                 ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/council-tips':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-products':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-whole-grain-studies':                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-whole-grain-benefits':                       ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-other-products':                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-diets':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-diets-students':                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public-whole-grain-in-schools':                     ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/public':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/save':                                         ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/product/**':                                        ['ROLE_USER', 'ROLE_ADMIN'],
   '/find_school_district':                              ['ROLE_ADMIN'],
   '/customer/**':                                       ['ROLE_ADMIN'],
   '/call':                                              ['ROLE_ADMIN'],
   '/call/**':                                           ['ROLE_ADMIN'],
   '/home/c_change_password':                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/c_password':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/c_2_change_password':                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/c_2_password':                                 ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/register_n':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/profile_help':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/assessment/':                                       ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/assessment/assess_process':                          ['ROLE_USER', 'ROLE_ADMIN'],
   '/assess/**':                                          ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/lc':                                      ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/complete':                                ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/cc':                                      ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/ir':                                      ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/favorite':                                ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/broker_contact':                          ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/feedback':                                ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/reformulations':                          ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/other_products':                          ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/rewards':                                 ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/finish':                                  ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment/dnr/**':                                  ['ROLE_USER', 'ROLE_ADMIN'],
   '/shopping/confirm':                                   ['ROLE_USER', 'ROLE_ADMIN'],
   '/shopping/place_order':                               ['ROLE_USER', 'ROLE_ADMIN'],
   '/shopping/thanks':                                    ['ROLE_USER', 'ROLE_ADMIN'],
   '/product/brokerEditFromEdit/**':                      ['ROLE_USER', 'ROLE_ADMIN'],
   '/product/brokerDeleteFromEdit/**':                    ['ROLE_USER', 'ROLE_ADMIN'],
   '/product/displayImage/*':                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/sponsor/displayImage':                               ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/send_message':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/c_forgot_password':                                 ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/c_passwd_reset':                                    ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/c_reset_success':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/forgot_password':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/passwd_reset':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/ecard/sendEcard':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/ecards_thanks':                                ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/ecards_send':                                  ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/**':                                                ['IS_AUTHENTICATED_ANONYMOUSLY']
]

grails.mail.default.from = 'superkidssampling@gmail.com'

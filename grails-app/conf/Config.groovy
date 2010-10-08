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
grails.views.gsp.sitemesh.preprocess = true
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
        grails.serverURL = "http://www.changeme.com"
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
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'

    warn   'org.mortbay.log'
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
   '/admin':                                             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/caller':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/admin/**':                                                            ['ROLE_ADMIN'],
   '/factoid':                                                             ['ROLE_ADMIN'],
   '/factoid/**':                                                          ['ROLE_ADMIN'],
   '/':                                                  ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/*':                                                 ['ROLE_USER', 'ROLE_ADMIN'],
   '/*':                                                                   ['ROLE_ADMIN'],
   '/login/**':                                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/logout':                                  ['ROLE_USER', 'ROLE_ADMIN', 'ROLE_CALLER'],
   '/logout/**':                                         ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/register':                                          ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/enter_site':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/edit_profile':                                                         ['ROLE_USER'],
   '/cart':                                                                 ['ROLE_USER'],
   '/broker':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-products':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-whole-grain-benefits':                       ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-whole-grain-studies':                        ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/incorporating-whole-grains-in-schools':             ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-participate':                                ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/broker-ecard':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/learn.cfm':                                              ['ROLE_USER', 'ROLE_ADMIN'],
   '/order.cfm':                                              ['ROLE_USER', 'ROLE_ADMIN'],
   '/assess.cfm':                                             ['ROLE_USER', 'ROLE_ADMIN'],
   '/promote.cfm':                                            ['ROLE_USER', 'ROLE_ADMIN'],
   '/contact':                                           ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/assessment-drawing-rules':                               ['ROLE_USER', 'ROLE_ADMIN'],
   '/assessment-tools':                                       ['ROLE_USER', 'ROLE_ADMIN'],
   '/ecards':                                                 ['ROLE_USER', 'ROLE_ADMIN'],
   '/promotion-tools-and-resources':                          ['ROLE_USER', 'ROLE_ADMIN'],
   '/additional-promotional-ideas':                           ['ROLE_USER', 'ROLE_ADMIN'],
   '/what-is':                                                ['ROLE_USER', 'ROLE_ADMIN'],
   '/ultragrain':                                             ['ROLE_USER', 'ROLE_ADMIN'],
   '/sustagrain':                                             ['ROLE_USER', 'ROLE_ADMIN'],
   '/superkids-products':                                     ['ROLE_USER', 'ROLE_ADMIN'],
   '/testimonials':                                           ['ROLE_USER', 'ROLE_ADMIN'],
   '/about':                                                  ['ROLE_USER', 'ROLE_ADMIN'],
   '/whole-grain-list':                                       ['ROLE_USER', 'ROLE_ADMIN'],
   '/whole-grain-benefits':                                   ['ROLE_USER', 'ROLE_ADMIN'],
   '/whole-grain-studies':                                    ['ROLE_USER', 'ROLE_ADMIN'],
   '/sneaky-chef':                                            ['ROLE_USER', 'ROLE_ADMIN'],
   '/council-tips':                                           ['ROLE_USER', 'ROLE_ADMIN'],
   '/public':                                            ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/home/save':                                         ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/product/**':                                             ['ROLE_ADMIN', 'ROLE_USER'],
   '/find_school_district':                                                ['ROLE_ADMIN'],
   '/customer/**':                                                         ['ROLE_ADMIN'],
   '/call':                                                 ['ROLE_CALLER', 'ROLE_ADMIN'],
   '/call/**':                                              ['ROLE_CALLER', 'ROLE_ADMIN'],
   '/home/c_change_password':                                               ['ROLE_USER'],
   '/home/c_password':                                                      ['ROLE_USER'],
   '/home/register_n':                                   ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/profile_help':                                      ['IS_AUTHENTICATED_ANONYMOUSLY'],
   '/assessment':                                                          ['ROLE_ADMIN'],
   '/assessment/assess_process':                              ['ROLE_USER', 'ROLE_ADMIN']

]

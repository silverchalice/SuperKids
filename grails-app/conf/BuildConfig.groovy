grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsPlugins()
        grailsHome()

        mavenRepo "https://repo.grails.org/grails/core"
        mavenRepo "http://repo.grails.org/grails/repo/"

        mavenLocal()
        grailsCentral()
        mavenCentral()
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://repository.codehaus.org"
        mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.29'
        compile 'antlr:antlr:2.7.7'
        compile 'org.slf4j:jcl-over-slf4j:1.7.5'
        compile 'org.slf4j:slf4j-api:1.7.5'
    }
    plugins {
        build ":tomcat:7.0.54"

        compile ":scaffolding:2.0.3"
        compile ':cache:1.1.7'

        // plugins needed at runtime but not for compilation
        runtime ":hibernate:3.6.10.16" // or ":hibernate4:4.3.5.4"
        runtime ":jquery:1.11.1"

    }
}

grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.work.dir = "target/$grailsVersion"
grails.project.plugins.dir = "plugins"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits "global", {
        excludes "xml-apis", "commons-digester", "ehcache"
    }

    log "info" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenLocal()
        mavenCentral()

        mavenRepo "https://oss.sonatype.org/content/repositories/releases/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.22'
        compile "org.jadira.usertype:usertype.jodatime:1.9"
    }

    plugins {
        compile ":joda-time:1.4"

        runtime ":hibernate:$grailsVersion",
                ":jquery:1.8.3",
                ":jquery-ui:1.8.24",
                ":resources:1.2.RC2"

        build ":tomcat:$grailsVersion"

        compile ':cache:1.0.1'

        // Spring Security
        copmpile ':spring-security-core:1.2.7.3'
        compile ':famfamfam:1.0.1'
        compile ':spring-security-ui:0.2'
        compile ':mail:1.0.1'
        compile ':spring-security-acl:1.1.1'
        compile ':twitter-bootstrap:2.2.2'


    }
}
grails.tomcat.jvmArgs = ['-Xmx512m', '-XX:MaxPermSize=256m', '-Dinitial.admin.password=changeit',
        '-Dload.fixtures=1']

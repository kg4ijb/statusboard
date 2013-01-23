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

    log "debug" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        mavenRepo "http://snapshots.repository.codehaus.org"
        mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "https://oss.sonatype.org/content/repositories/releases/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.22'
        compile "org.jadira.usertype:usertype.jodatime:1.9"
    }

    plugins {
        compile ":joda-time:1.4"

        //compile("joda-time:joda-time-hibernate:1.3") {
        //    excludes "joda-time", "hibernate"
        //}
        runtime ":hibernate:$grailsVersion",
                ":jquery:1.8.3",
                ':resources:1.2.RC2'

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0"
        //runtime ":cached-resources:1.0"
        //runtime ":yui-minify-resources:0.1.4"

        build ":tomcat:$grailsVersion"

        compile ':cache:1.0.1' //',
        ':platform-core:1.0.RC2'

        runtime ":cache-ehcache:1.0.0", { exclude "cache" }

    }
}
grails.tomcat.jvmArgs = ['-Xmx512m', '-XX:MaxPermSize=256m', '-Dinitial.admin.password=changeit',
        '-Dload.fixtures=1']

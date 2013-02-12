grails.servlet.version = "2.5" /*
 * Copyright 2005-2013 StationStatusboard.com
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */ // Change depending on target container compliance (2.5 or 3.0)
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
        compile ':twitter-bootstrap:2.3.0'


    }
}
grails.tomcat.jvmArgs = ['-Xmx512m', '-XX:MaxPermSize=256m', '-Dinitial.admin.password=changeit',
        '-Dload.fixtures=1']

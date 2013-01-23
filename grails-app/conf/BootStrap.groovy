import com.statusboard.*
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->

        // See if we're in development
        if (Environment.current == Environment.DEVELOPMENT) {
            println("Bootstrapping some data...")

            // Spring Security
            println("   creating spring security user and roles...")
            def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
            def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
            def testUser = new User(username: 'admin', enabled: true, password: 'password')
            testUser.save(flush: true)

            UserRole.create(testUser, adminRole, true)
            //assert User.count() == 1
            //assert Role.count() == 2
            //assert UserRole.count() == 1

            // shift
            println("   creating Duty Shifts...")
            DutyShift.findOrSaveWhere(name: "A", description: "A Shift").save(flush: true)
            DutyShift.findOrSaveWhere(name: "B", description: "B Shift").save(flush: true)
            DutyShift.findOrSaveWhere(name: "C", description: "C Shift").save(flush: true)
            DutyShift.findOrSaveWhere(name: "D", description: "D Shift").save(flush: true)
            DutyShift.findOrSaveWhere(name: "E", description: "E Shift").save(flush: true)
            DutyShift.findOrSaveWhere(name: "H", description: "ACFR").save(flush: true)

            // ApparatusStatus
            println("   creating apparatus status...")
            ApparatusStatus.findOrSaveWhere(name: "In-Service").save(flush: true)
            ApparatusStatus.findOrSaveWhere(name: "Out of Service").save(flush: true)
            ApparatusStatus.findOrSaveWhere(name: "Out of Service Shop").save(flush: true)
            ApparatusStatus.findOrSaveWhere(name: "On Detail").save(flush: true)


            ApparatusStatus status = ApparatusStatus.findWhere(name: "In-Service").save(flush: true)

            // Seats
            //println("   creating seat instances...")
            def s1 = Seat.findOrSaveWhere(number: 1, name: "Operator").save(flush: true)
            def s2 = Seat.findOrSaveWhere(number: 2, name: "OIC").save(flush: true)
            def s3 = Seat.findOrSaveWhere(number: 3, name: "Seat 3").save(flush: true)
            def s4 = Seat.findOrSaveWhere(number: 4, name: "Seat 4").save(flush: true)
            def s5 = Seat.findOrSaveWhere(number: 5, name: "Seat 5").save(flush: true)
            def s6 = Seat.findOrSaveWhere(number: 6, name: "Seat 6").save(flush: true)

            // Apparatus
            println("   creating some apparatus...")
            Apparatus.findOrSaveWhere(name: "E81", description: "Engine 81", isALS: true, isRescue: true, status: status, numSeats: 6).save(flush: true)
            Apparatus.findOrSaveWhere(name: "E82", description: "Engine 82", isALS: true, isRescue: true, status: status, numSeats: 6).save()
            Apparatus.findOrSaveWhere(name: "E85", description: "Engine 85", isALS: true, isRescue: true, status: ApparatusStatus.findWhere(name: 'On Detail'), numSeats: 5).save()
            Apparatus.findOrSaveWhere(name: "T8", description: "Tower 8", status: status, numSeats: 5).save()
            Apparatus.findOrSaveWhere(name: "RK89", description: "Car 89", status: status, numSeats: 4).save()
            Apparatus.findOrSaveWhere(name: "MO8", description: "Mobile 8", status: status, numSeats: 2).save()
            Apparatus.findOrSaveWhere(name: "RK81", description: "Car 81", status: status, numSeats: 2).save()
            Apparatus.findOrSaveWhere(name: "U81", description: "Utility 81", status: status, numSeats: 2).save()

            // Rank
            println("   creating ranks...")
            Rank.findOrSaveWhere(rank: "FFI", description: "Firefighter Rescuer I (DOT)")
            Rank.findOrSaveWhere(rank: "FFII", description: "Firefighter Rescuer II (released DOT)")
            Rank.findOrSaveWhere(rank: "FFIII", description: "Firefighter Rescuer III")
            Rank.findOrSaveWhere(rank: "MFF", description: "Master Firefighter (senior)")
            Rank.findOrSaveWhere(rank: "LT", description: "Lieutenant")
            Rank.findOrSaveWhere(rank: "CPT", description: "Captain")
            Rank.findOrSaveWhere(rank: "BC", description: "Battalion Chief")
            Rank.findOrSaveWhere(rank: "DC", description: "Deputy Chief")
            Rank.findOrSaveWhere(rank: "AC", description: "Assistant Chief")
            Rank.findOrSaveWhere(rank: "C", description: "Chief")

            // EMS Level
            println("   creating EMS levels...")
            EmsLevel.findOrSaveWhere(description: "EMR").save(flush: true)
            EmsLevel.findOrSaveWhere(description: "EMT-B").save(flush: true)
            EmsLevel.findOrSaveWhere(description: "EMT-E").save(flush: true)
            EmsLevel.findOrSaveWhere(description: "EMT-I").save(flush: true)
            EmsLevel.findOrSaveWhere(description: "EMT-P").save(flush: true)

            // DutyTime
            println("   creating duty times...")
            DutyTime.findOrSaveWhere(name: "0600-1800").save(flush: true)
            DutyTime.findOrSaveWhere(name: "1800-0600").save(flush: true)
            DutyTime.findOrSaveWhere(name: "0600-0600").save(flush: true)

            // need some users...
            println("   creating some users...")

            def user
            user = new Staff(username: 'soconnor',
                    lastName: "O'Connor",
                    firstName: 'Sean',
                    password: 'password',
                    rank: Rank.findWhere(rank: 'CPT'),
                    fdid: '8010',
                    emsLevel: EmsLevel.findWhere(description: 'EMR'),
                    dutyShift: DutyShift.findWhere(name: 'E'),
                    enabled: true).save(flush: true)
            UserRole.create(user, adminRole, true)

            user = new Staff(username: 'cbyam',
                    lastName: "Byam",
                    firstName: 'Chuck',
                    password: 'password',
                    rank: Rank.findWhere(rank: 'MFF'),
                    fdid: '8011',
                    emsLevel: EmsLevel.findWhere(description: 'EMT-P'),
                    dutyShift: DutyShift.findWhere(name: 'E'),
                    enabled: true).save(flush: true)
            UserRole.create(user, adminRole, true)

            //println("${s1.name} : ${s1.number}")
            println("Done bootstrapping data...")
        } else {
            println("Not doing any bootstrap...")
        }

    }

    def destroy = {

    }
}

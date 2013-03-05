import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.GrailsApplication;
import com.sourceallies.User
import com.sourceallies.Derby
import com.sourceallies.Vehicle
import com.sourceallies.Owner
import com.sourceallies.Race
import com.sourceallies.Role
import com.sourceallies.UserRole

class BootStrap {

    def init = { servletContext ->
		def manRole = Role.findByAuthority('ROLE_MANAGER') ?: new Role(authority: 'ROLE_MANAGER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

		def adminUser = User.findByUsername('kesslerdn') ?: new User(
				username: 'kesslerdn',
				password: '126e544e151abc7da265a46a1ebf8a89c8cb6b70bb786801d34574a34c0ff47e',
				email: 'kesslerdn@gmail.com',
				enabled: true).save(failOnError: true)
		if (!UserRole.findByUserAndRole(adminUser, adminRole)) {
			UserRole.create adminUser, adminRole
		}
		if (!UserRole.findByUserAndRole(adminUser, manRole)) {
			UserRole.create adminUser, manRole
		}
		def testUser = User.findByUsername('test') ?: new User(
			username: 'test',
			password: '126e544e151abc7da265a46a1ebf8a89c8cb6b70bb786801d34574a34c0ff47e',
			email: 'kesslerdn@gmail.com',
			enabled: true).save(failOnError: true)

			if (!UserRole.findByUserAndRole(testUser, manRole)) {
				UserRole.create testUser, manRole
			}
			
		if (GrailsUtil.environment == GrailsApplication.ENV_DEVELOPMENT) {
			def today = new Date();
			
			def adminDerby = new Derby(organizationNumber: "111", city: "Admin City", state: "AK",
				locationName: "Admin Place", type: "Pinewood Derby", date:today, 
				user: adminUser, hashKey: "admin-hash-key")
			def adminRace = new Race(name: "Admin Race", numberOfLanes: 4, 
				user: adminUser)
			def adminVehicle = new Vehicle(vehicleName:"Admin Vehicle",
					user: adminUser)
			def adminOwner = new Owner(firstName: "Adam", lastName: "Adamson",
				vehicle: adminVehicle, user: adminUser)
			adminDerby.addToRaces(adminRace)
			adminRace.addToVehicles(adminVehicle)
			adminDerby.save(failOnError: true)
			adminRace.save(failOnError: true)
			adminVehicle.save(failOnError: true)
			adminOwner.save(failOnError: true)
			
			def testDerby = new Derby(organizationNumber: "222", city: "Test City", state: "CA",
				locationName: "Test Place", type: "Raingutter Regatta", date:today, 
				user:testUser, hashKey: "test-hash-key")
			def testRace = new Race(name: "Test Race", numberOfLanes: 6, 
				user: testUser)
			def testVehicle = new Vehicle(vehicleName:"Test Vehicle", 
				user: testUser)
			def testOwner = new Owner(firstName: "Tom", lastName: "Thompson",
				vehicle: testVehicle, user: testUser)
			testDerby.addToRaces(testRace)
			testRace.addToVehicles(testVehicle)
			testDerby.save(failOnError: true)
			testRace.save(failOnError: true)
			testVehicle.save(failOnError: true)
			testOwner.save(failOnError: true)

		}
	
    }
    def destroy = {
		
    }
}

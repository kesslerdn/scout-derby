import com.sourceallies.User
import com.sourceallies.Role
import com.sourceallies.UserRole

class BootStrap {

    def init = { servletContext ->
		def manRole = Role.findByAuthority('ROLE_MANAGER') ?: new Role(authority: 'ROLE_MANAGER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

		def adminUser = User.findByUsername('kesslerdn') ?: new User(
				username: 'kesslerdn',
				password: '9cd9a989cf18cbf0e1f5bc7bb6033b9b02f5540b406c6f47de6a818ac91218e4',
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
			password: '9cd9a989cf18cbf0e1f5bc7bb6033b9b02f5540b406c6f47de6a818ac91218e4',
			email: 'kesslerdn@gmail.com',
			enabled: true).save(failOnError: true)

			if (!UserRole.findByUserAndRole(testUser, manRole)) {
				UserRole.create testUser, manRole
			}
	
    }
    def destroy = {
    }
}

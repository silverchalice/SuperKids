import com.superkids.domain.Customer
import com.superkids.domain.User
import com.superkids.domain.Product
import com.superkids.domain.Sponsor
import com.superkids.domain.Role
import com.superkids.domain.UserRole
import com.superkids.domain.Address

class BootStrap {
    def springSecurityService
    def init = { servletContext ->

		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

		String password = springSecurityService.encodePassword('password')
		def testUser = new User(username: 'me', enabled: true, password: password)
		testUser.save(flush: true)
		UserRole.create testUser, adminRole, true

		def user1 = new User(username: 'info@silver-chalice.com', enabled: true, password: password)
	    user1.save(flush: true)
		UserRole.create user1, userRole, true

		def user2 = new User(username: 'info@green-plate.com', enabled: true, password: password)
		user2.save(flush: true)
		UserRole.create user2, userRole, true

		def customer = new Customer(
			district:'Silver Chalice Schools',
			address:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'Missouri', zip:'63136'),
			phone:'(608) 617-3960',
			email:'info@silver-chalice.com',
			user:user1,
			fsdName:'FSD',
			fsdTitle:'Mr.',
			fsdEmail:'fsd@silver-chalice.com',
			studentsInDistrict: '12',
			facilities: '1',
			breakfastsServed: '12',
			lunchesServed: '12',
			snacksServed:'12',
			hasBakery: false,
			purchaseFrozenBread: true,
			purchaseFreshBread: false,
			purchasePreparedFood: true,
			purchaseFrozenFood:true
		)


		def customer2 = new Customer(
			district:'Green Plate Schools',
			address:new Address(street:'62 Harneywold Drive', city:'St Louis', state:'Missouri', zip:'63146'),
			phone:'(608) 617-3960',
			email:'info@green-plate.com',
			user:user2,
			fsdName:'FSD',
			fsdTitle:'Mr.',
			fsdEmail:'fsd@green-plate.com',
			studentsInDistrict: '15',
			facilities: '2',
			breakfastsServed: '15',
			lunchesServed: '15',
			snacksServed:'15',
			hasBakery: false,
			purchaseFrozenBread: false,
			purchaseFreshBread: true,
			purchasePreparedFood: true,
			purchaseFrozenFood:true
		)

		def sponsor1 = new Sponsor(
			name:'ACME Foods, Inc',
			address: new Address(street:'123 Wall Street', city:'Los Angeles', state: 'California', zip:'93456'),
			phone:'1-800 123 4567',
			website:'www.acmefoods.com',
			salesContact:'John Doe, jdoe@acmefoods.com 123-456-7890',
			sampleContact:'Jane Smith jsmith@acmefoods.com 123-456-0987',
			products:[]
		).save()

		def product1 = new Product(
			name:'Healthy Hot Dog',
			description:'This hot dog is very healthy.',
			details:'A Healthy Hot Dog is a great way to get healthy hot dogs into your diet.',
			nutrition:'Fat:0g, Sugar:0g, Protein:0g, Potassium:13g, Uranium:14g',
			image:new File('/home/zak/builds/SuperKids/web-app/uploads/product1.png').readBytes(),
			summary:new File('/home/zak/builds/SuperKids/web-app/uploads/product1.pdf').readBytes(),
//			image:new File('/home/ben/dev/SuperKids/web-app/uploads/product1.png').readBytes(),
//			summary:new File('/home/ben/dev/SuperKids/web-app/uploads/product1.pdf').readBytes(),
			sponsor:sponsor1
		).save()

		def product2 = new Product(
			name:'Whole Wheat Waffles',
			description:'These waffles are made with whole wheat.',
			details:'Whole Wheat Waffles are great waffles made with whole wheat.',
			nutrition:'Fat:0g, Sugar:0g, Protein:0g, Lithium:2g, Argon:12g',
			image:new File('/home/zak/builds/SuperKids/web-app/uploads/product2.png').readBytes(),
			summary:new File('/home/zak/builds/SuperKids/web-app/uploads/product2.pdf').readBytes(),
//			image:new File('/home/ben/dev/SuperKids/web-app/uploads/product1.png').readBytes(),
//			summary:new File('/home/ben/dev/SuperKids/web-app/uploads/product1.pdf').readBytes(),
			sponsor:sponsor1
		).save()

		sponsor1.addToProducts(product1)
		sponsor1.addToProducts(product2)

		customer.save()
		customer2.save()

    }

    def destroy = {
    }

}

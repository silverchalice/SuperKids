import com.superkids.domain.Customer
import com.superkids.domain.User
import com.superkids.domain.Product
import com.superkids.domain.Sponsor
import com.superkids.domain.Role
import com.superkids.domain.UserRole
import com.superkids.domain.Address
import com.superkids.domain.PageText
import com.superkids.domain.Caller

class BootStrap {
    def springSecurityService
    def init = { servletContext ->

//		def superkids = '/home/zak/builds/SuperKids'
		def superkids = '/home/ben/dev/SuperKids'

		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
                def callerRole = new Role(authority: 'ROLE_CALLER').save(flush:true)

		String password = springSecurityService.encodePassword('password')
		def testUser = new User(username: 'me', enabled: true, password: password)
		testUser.save(flush: true)
		UserRole.create testUser, adminRole, true

		def customer = new Customer(
			district:'Silver Chalice Schools',
			address:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'Missouri', zip:'63136'),
			phone:'(608) 617-3960',
			email:'info@silver-chalice.com',
			username:'info@silver-chalice.com',
			password:password,
			enabled : true,
			accountExpired : false,
			accountLocked : false,
			passwordExpired : false,
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
			username:'info@green-plate.com',
			password:password,
			enabled : true,
			accountExpired : false,
			accountLocked : false,
			passwordExpired : false,
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
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product2 = new Product(
			name:'Whole Wheat Waffles',
			description:'These waffles are made with whole wheat.',
			details:'Whole Wheat Waffles are great waffles made with whole wheat.',
			nutrition:'Fat:0g, Sugar:0g, Protein:0g, Lithium:2g, Argon:12g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		sponsor1.addToProducts(product1)
		sponsor1.addToProducts(product2)

		customer.save()
		customer2.save()

                def c = new Caller(username:"foo", password:springSecurityService.encodePassword("password"), enabled:true).save()

		UserRole.create customer, userRole, true
		UserRole.create customer2, userRole, true
                UserRole.create c, callerRole, true

                def brokerText = new PageText(name:"broker", content:"""
<h1>SuperKids Program Overview</h1>
<br/>
<img style="position: absolute; right: 15px; bottom: 12px; width: 160px; height: 430px;" src="/SuperKids/images/NEWGIRLeatingpizzaVERTICAL.jpg" alt="">
<p>SuperKids gives foodservice directors free samples of whole grain products from a variety of trusted food companies and bakeries. All products are made with Ultragrain<sup>® </sup>and/or Sustagrain<sup>®</sup>. Sample products are free and come with no purchase obligation.</p>
<p>SuperKids asks for foodservice director feedback on how they liked the products. This feedback (in the form of trial assessment data) will be used by our food manufacturers to develop new products. In addition, we use it to report demand to foodservice distributors and brokers like you.</p>
<p><strong style="color:#993300; font-size:16px;">We can prove high acceptance of whole grain products in our nation's schools.</strong> SuperKids is in its fourth year. Last year, over 1,284 of the largest public school districts in America requested and received 6,079 product samples from a pool of 16 products made with Ultragrain. In independent studies, elementary school students consumed products made with Ultragrain at the same levels as products made with refined flour. The difference is Ultragrain's taste, look and texture. It's revolutionary, innovative, and a major technological breakthrough.</p>
<p><strong style="color:#993300; font-size:16px;">Ultragrain: Whole Grain Nutrition. White Flour Appeal.</strong> Ultragrain makes it possible for students to receive higher amounts of fiber, along with the full nutritive value of whole grains in foods they are familiar with and love. With Ultragrain, students don't notice changes in color, taste or texture that they often complain about when eating foods that use traditional whole grain flour.</p>
<p><strong style="color:#993300; font-size:16px;">Sustragrain: The Ultra High-Fiber Whole Grain.</strong> SuperKids products made with Sustagrain offer another way to increase whole grain and fiber consumption in school lunches. In flour form, Sustagrain can be used in baked goods, meat preparations, sauces and dips. In flake form, it works great in hot cereals, snacks, desserts and toppings. <strong>Select your choice from the menu options on the left.</strong></p>

                """
                ).save()

    }

    def destroy = {
    }

}

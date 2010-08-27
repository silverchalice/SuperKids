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

		def superkids = '/Users/zak/builds/SuperKids'
//		def superkids = '/home/ben/dev/SuperKids'

		def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError:true, flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(failOnError:true, flush: true)
                def callerRole = new Role(authority: 'ROLE_CALLER').save(failOnError:true, flush:true)

		String password = springSecurityService.encodePassword('password')
		def testUser = new User(username: 'me', enabled: true, password: password)
		testUser.save(failOnError:true, flush: true)
		UserRole.create testUser, adminRole, true

		def customer = new Customer(
			district:'Silver Chalice Schools',
			address:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'MO', zip:'63136'),
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
			address:new Address(street:'62 Harneywold Drive', city:'St Louis', state:'MO', zip:'63146'),
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
			address: new Address(street:'123 Wall Street', city:'Los Angeles', state: 'CA', zip:'93456'),
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

		def product3 = new Product(
			name:'Healthy Spaghetti',
			description:'This spaghetti is made entirely using dried seaweed.',
			details:'Healthy Spaghetti is made with healthy whole wheat seaweed.',
			nutrition:'Fat:0g, Sugar:0g, Protein:0g, Calcium:0g, Potassium:0g, Carbon:20g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product4 = new Product(
			name:'Whole Wheat Spinach',
			description:'Spinach with a dash of whole wheat.',
			details:'Whole Wheat Spinach counts as one complete serving on the USDA Five A Day chart for fruit and vegetables.',
			nutrition:'Fat:0g, Sugar:0g, Taste:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product5 = new Product(
			name:'Healthy Octopus',
			description:'Healthy octopus guaranteed to be no more than three hundred years old.',
			details:'Healthy Octopus is fresh. We do not make it until you order it, as long as you ordered it quite a while ago.',
			nutrition:'Ion:0g, Sugar:0g, Rapid Sucking Action:10g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product6 = new Product(
			name:'Whole Wheat Clam Parts',
			description:'These clam parts are made with whole wheat and may contain pearls.',
			details:'Scientists now believe that these clams are exactly what the National Anthem is talking about when it says Over the clam parts we watched.',
			nutrition:'Seafood:1g, Gravity:3g, Small Dead Or Dying Sea Organisms:2g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product7 = new Product(
			name:'Healthy Anti-Gravity Space Suit',
			description:'This anti-gravity space suit is healthier than most.',
			details:'This space suit minimizes the effects of gravity, a leading cause of falling down, which top medical experts believe can have harmful effects on your health.',
			nutrition:'Aluminum:0.2g, Plastic:1g, Zinc:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product8 = new Product(
			name:'Whole Wheat Steak',
			description:'This steak is made with whole wheat and various small insects that fell into the grinder by accident.',
			details:'This is whole wheat steak, with wheat and other natural and artificial flavors.',
			nutrition:'Carbon Monoxide:0g, Vanilla:0g, Bat wings:0g, Sea lion:2g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product9 = new Product(
			name:'Healthy Yak',
			description:'Healthy yak, a great source of fiber (or fur).',
			details:'The yak contains high levels of fur, which resembles whole wheat somewhat in texture and very much in taste.',
			nutrition:'Fat:10g, Snake:0g, Meat (rhymes with wheat):2g, Grass:12g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product10 = new Product(
			name:'Whole Wheat Diplodocus',
			description:'This Diplodocus ate only whole wheat or variants.',
			details:'May take 68 weeks for shipping, or longer if we cannot find a reliable source.',
			nutrition:'Cloves:0g, Wheat:2g, Wheat-resembling substances:12g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product11 = new Product(
			name:'Healthy Soybeans',
			description:'Soybeans contain mainly health, as opposed to taste or nutrition.',
			details:'These soybeans are worth their weight in deceased members of the arthropod family.',
			nutrition:'Fat:0g, Sugar:0g, Protein:0g, Potassium:0g, Sodium:0g, Soybeanium:100g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		def product12 = new Product(
			name:'Whole Wheat Buffalo Wings',
			description:'Buffalo wings made from whole wheat.',
			details:'These Buffalo Wings are made with wheat-based imitation buffalo.',
			nutrition:'Wheat:100g, Taste:-20g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1
		).save()

		sponsor1.addToProducts(product1)
		sponsor1.addToProducts(product2)

		customer.save(failOnError:true)
		customer2.save(failOnError:true)

                def c = new Caller(username:"foo", password:springSecurityService.encodePassword("password"), enabled:true).save(failOnError:true)

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

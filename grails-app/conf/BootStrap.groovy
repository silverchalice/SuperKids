import com.metasieve.shoppingcart.ShoppingItem
import com.superkids.PageTextLoader
import com.superkids.domain.*

class BootStrap {
    def springSecurityService
    def init = { servletContext ->

	//def superkids = '/Users/zak/builds/SuperKids/web-app'
	//	def superkids = '/home/ben/dev/SuperKids/web-app'
		//def superkids = '/opt/tomcat/webapps/SuperKids/'



        //       def statesAvailable = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
		//	  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
		//	  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
		//	  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
		//	  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
		//	  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
		//	  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
		//	  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
		//	  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
		//	  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
//def adminRole = Role.findByAuthority('ROLE_ADMIN')
		//def userRole = new Role(authority: 'ROLE_USER').save(failOnError:true, flush: true)
        //def callerRole = new Role(authority: 'ROLE_CALLER').save(failOnError:true, flush:true)

//String password = springSecurityService.encodePassword('superkids112')

	    //String password2 = springSecurityService.encodePassword('superkids')
//def testAdmin = new Admin(username: 'admin', firstName:'Ebenezer', lastName:'Scrooge', email:'ebenezer@scroogeandmarley.co.uk', enabled: true, password: password)
//testAdmin.save(failOnError:true, flush: true)

        //def otherTestAdmin = new Admin(username: 'other_admin', firstName:'Jacob', lastName:'Marley', email:'jacob@scroogeandmarley.co.uk', enabled: true, password: password)
		//otherTestAdmin.save(failOnError:true, flush: true)

//UserRole.create testAdmin, adminRole, true
		//UserRole.create otherTestAdmin, adminRole, true
		//def customer = new Customer(
		//	district:'Silver Chalice Schools',
		//	deliveryAddress:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'Missouri', zip:63136),
		//	phone:'(608) 617-3960',
		//	email:'info@silver-chalice.com',
		//	username:'info@silver-chalice.com',
		//	password:password,
		//	enabled : true,
		//	accountExpired : false,
		//	accountLocked : false,
		//	passwordExpired : false,
		//	fsdName:'FSD',
		//	fsdTitle:'Mr.',
		//	fsdEmail:'fsd@silver-chalice.com',
		//	studentsInDistrict: 12,
		//	facilities: 1,
		//	breakfastsServed: 12,
		//	lunchesServed: 12,
		//	snacksServed:12,
		//	hasBakery: false,
		//	purchaseFrozenBread: true,
		//	purchaseFreshBread: false,
		//	purchasePreparedFood: true,
		//	purchaseFrozenFood:true
		//)

		//def customer2 = new Customer(
		//	district:'Green Plate Schools',
		//	deliveryAddress:new Address(street:'62 Harneywold Drive', city:'St Louis', state:'Missouri', zip:63146),
		//	phone:'(608) 617-3960',
		//	email:'info@green-plate.com',
		//	username:'info@green-plate.com',
		//	password:password,
		//	enabled : true,
		//	accountExpired : false,
		//	accountLocked : false,
		//	passwordExpired : false,
		//	fsdName:'FSD',
		//	fsdTitle:'Mr.',
		//	fsdEmail:'fsd@green-plate.com',
		//	studentsInDistrict: 15,
		//	facilities: 2,
		//	breakfastsServed: 15,
		//	lunchesServed: 15,
		//	snacksServed: 15,
		//	hasBakery: false,
		//	purchaseFrozenBread: false,
		//	purchaseFreshBread: true,
		//	purchasePreparedFood: true,
		//	purchaseFrozenFood:true
		//)
        //
        //def shoppingItem1 = new ShoppingItem().save()
        //def shoppingItem2 = new ShoppingItem().save()
        //def shoppingItem3 = new ShoppingItem().save()
        //def shoppingItem4 = new ShoppingItem().save()
        //def shoppingItem5 = new ShoppingItem().save()
        //def shoppingItem6 = new ShoppingItem().save()
        //def shoppingItem7 = new ShoppingItem().save()
        //def shoppingItem8 = new ShoppingItem().save()
        //def shoppingItem9 = new ShoppingItem().save()
        //def shoppingItem10 = new ShoppingItem().save()
        //def shoppingItem11 = new ShoppingItem().save()
        //def shoppingItem12 = new ShoppingItem().save()
        //
		//def sponsor1 = new Sponsor(
		//	name:'ACME Foods, Inc',
		//	address: '123 Wall Street Los Angeles CA 93456',
		//	phone:'1-800 123 4567',
		//	website:'www.acmefoods.com',
		//	logo:new File("${superkids}/images/sustagrain.gif").readBytes(),
		//	salesContact:'John Doe, jdoe@acmefoods.com 123-456-7890',
		//	sampleContact:'Jane Smith jsmith@acmefoods.com 123-456-0987',
		//	products:[]
		//).save()
        //
		//def sponsor2 = new Sponsor(
		//	name:'Foo, Inc',
		//	address: '123 Wall Street Los Angeles CA, 93456',
		//	phone:'1-800 123 4567',
		//	website:'www.acmefoods.com',
		//	logo:new File("${superkids}/images/ultragrain.gif").readBytes(),
		//	salesContact:'John Doe, jdoe@acmefoods.com 123-456-7890',
		//	sampleContact:'Jane Smith jsmith@acmefoods.com 123-456-0987',
		//	products:[]
		//).save()
        //
		//def product1 = new Product(
		//	name:'Product 1',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	bake:true,
		//	sponsor:sponsor1
		//).save(failOnError:true)
        //
		//def product2 = new Product(
		//	name:'Product 2',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product3 = new Product(
		//	name:'Product 3',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product4 = new Product(
		//	name:'Product 4',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product5 = new Product(
		//	name:'Product 5',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(), 			backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product6 = new Product(
		//	name:'Product 6',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product7 = new Product(
		//	name:'Product 7',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product8 = new Product(
		//	name:'Product 8',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product9 = new Product(
		//	name:'Product 9',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product10 = new Product(
		//	name:'Product 10',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//    parent:product9,
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product11 = new Product(
		//	name:'Product 11',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	parent:product9,
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//def product12 = new Product(
		//	name:'Product 12',
		//	description:'This is a description.',
		//	details:'These are some details.',
		//	nutrition:'Fat:0g, Sugar:0g',
		//	parent:product9,
		//	image:new File("${superkids}/uploads/product1.png").readBytes(),
		//	hoverImage:new File("${superkids}/uploads/product1-hover.png").readBytes(),
		//	backgroundImage:'product1-background.png',
		//	summary:new File("${superkids}/uploads/product1.pdf").readBytes(),
		//	statesAvailable:statesAvailable,
		//	sponsor:sponsor1
		//).save()
        //
		//customer.save(failOnError:true)
		//customer2.save(failOnError:true)
        //
        //def c = new Caller(username:"caller", password:springSecurityService.encodePassword("password"), enabled:true).save(failOnError:true)
        //
		//UserRole.create customer, userRole, true
		//UserRole.create customer2, userRole, true
        //UserRole.create c, callerRole, true
        //
        //def ptl = new PageTextLoader()
		//ptl.load()
        //
        //def shippingDate1 = new ShippingDate(shipDate:'November, 2010').save()
        //def shippingDate2 = new ShippingDate(shipDate:'January, 2011').save()
        //
        //def f1 = new Factoid(content:"An Eastern Michigan study (directed by Alice Jo Ranville PhD) found that kids who brown bag eat three times as many snack foods as school lunch program participants.").save()
        //def f2 = new Factoid(content:"Enacted more than 60 years ago, the school lunch program was developed to ensure that low-income children received at least one nutritious meal per day.").save()
        //def f3 = new Factoid(content:"9 out of 10 school districts nationwide ask students to test new menu items.").save()
        //def f4 = new Factoid(content:"According to the US Census Bureau, there are 54,000,000 K-12 school students in the United States.").save()
        //def f5 = new Factoid(content:"Eating more whole grains reduces the risk of inflammatory disease.").save()


		def shipDates = ShippingDate.list()
		shipDates.each {

			it.lastUpdated = new Date()
			it.save(flush: true)
		}

	}


    def destroy = {
    }

}

import com.superkids.domain.*

class BootStrap {

    def init = { servletContext ->

		def customer = new Customer(
			district:'Silver Chalice Schools',
			address:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'MO', zip:'63136'),
			phone:'(608) 617-3960',
			email:'info@silver-chalice.com',
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
			image:new File('/home/zak/builds/SuperKids/web-app/uploads/product1.png').readBytes(),
			summary:new File('/home/zak/builds/SuperKids/web-app/uploads/product1.pdf').readBytes(),
			sponsor:sponsor1
		).save()

		def product2 = new Product(
			name:'Whole Wheat Waffles',
			description:'These waffles are made with whole wheat.',
			details:'Whole Wheat Waffles are great waffles made with whole wheat.',
			nutrition:'Fat:0g, Sugar:0g, Protein:0g, Lithium:2g, Argon:12g',
			image:new File('/home/zak/builds/SuperKids/web-app/uploads/product2.png').readBytes(),
			summary:new File('/home/zak/builds/SuperKids/web-app/uploads/product2.pdf').readBytes(),
			sponsor:sponsor1
		).save()

		sponsor1.addToProducts(product1)
		sponsor1.addToProducts(product2)

		customer.save()
		customer2.save()

                def adminRole = new Role(authority:"ROLE_ADMIN").save()

                def fredTheUser = new User(username:"fred", password:"youdneverguessit", enabled:true, accountExpired:false, accountLocked:false, passwordExpired:false).save()

    }
    def destroy = {
    }
}

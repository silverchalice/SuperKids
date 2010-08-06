import com.superkids.domain.*

class BootStrap {

    def init = { servletContext ->


		def addy = new Address(street1:'61 Harneywold Drive', city:'St Louis', state:'MO', zip:'63136')

		def customer = new Customer(
			district:'Silver Chalice Schools',
			address:addy,
			phone:'(608) 617-3960',
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

		def addy2 = new Address(street1:'62 Harneywold Drive', city:'St Louis', state:'MO', zip:'63146')

				def customer2 = new Customer(
					district:'Green Plate Schools',
					address:addy2,
					phone:'(608) 617-3960',
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


		addy.save()
		addy2.save()
		customer.save()
		customer2.save()
    }
    def destroy = {
    }
}

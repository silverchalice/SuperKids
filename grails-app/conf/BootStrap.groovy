import com.superkids.PageTextLoader
import com.superkids.domain.*

class BootStrap {
    def springSecurityService
    def init = { servletContext ->
//        if(!Admin.list()) {
//
//
//            def superkids = '/Users/zak/Dev/SuperKids/web-app'
////        def superkids = '/home/ben/dev/SuperKids/web-app'
////        def superkids = '/opt/tomcat/webapps/SuperKids/'
//
//
//            def statesAvailable = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
//                                   'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
//                                   'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
//                                   'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
//                                   'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
//                                   'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
//                                   'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
//                                   'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
//                                   'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
//                                   'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
//            def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError: true, flush: true)
//            def userRole = new Role(authority: 'ROLE_USER').save(failOnError: true, flush: true)
//            def callerRole = new Role(authority: 'ROLE_CALLER').save(failOnError: true, flush: true)
//
//            String password = springSecurityService.encodePassword('superkids')
//
//            def testAdmin = new Admin(username: 'admin', firstName: 'Ebenezer', lastName: 'Scrooge', email: 'ebenezer@scroogeandmarley.co.uk', enabled: true, password: password)
//            testAdmin.save(failOnError: true, flush: true)
//
//            UserRole.create testAdmin, adminRole, true
//            def customer = new Customer(
//                    district: 'Silver Chalice Schools',
//                    deliveryAddress: new Address(street: '61 Harneywold Drive', city: 'St Louis', state: 'Missouri', zip: 63136),
//                    phone: '(608) 617-3960',
//                    email: 'info@silver-chalice.com',
//                    username: 'info@silver-chalice.com',
//                    password: password,
//                    enabled: true,
//                    accountExpired: false,
//                    accountLocked: false,
//                    passwordExpired: false,
//                    fsdName: 'FSD',
//                    fsdTitle: 'Mr.',
//                    fsdEmail: 'fsd@silver-chalice.com',
//                    studentsInDistrict: 12,
//                    facilities: 1,
//                    breakfastsServed: 12,
//                    lunchesServed: 12,
//                    snacksServed: 12,
//                    hasBakery: false,
//                    purchaseFrozenBread: true,
//                    purchaseFreshBread: false,
//                    purchasePreparedFood: true,
//                    purchaseFrozenFood: true
//            )
//
//            def customer2 = new Customer(
//                    district: 'Green Plate Schools',
//                    deliveryAddress: new Address(street: '62 Harneywold Drive', city: 'St Louis', state: 'Missouri', zip: 63146),
//                    phone: '(608) 617-3960',
//                    email: 'info@green-plate.com',
//                    username: 'info@green-plate.com',
//                    password: password,
//                    enabled: true,
//                    accountExpired: false,
//                    accountLocked: false,
//                    passwordExpired: false,
//                    fsdName: 'FSD',
//                    fsdTitle: 'Mr.',
//                    fsdEmail: 'fsd@green-plate.com',
//                    studentsInDistrict: 15,
//                    facilities: 2,
//                    breakfastsServed: 15,
//                    lunchesServed: 15,
//                    snacksServed: 15,
//                    hasBakery: false,
//                    purchaseFrozenBread: false,
//                    purchaseFreshBread: true,
//                    purchasePreparedFood: true,
//                    purchaseFrozenFood: true
//            )
//
//            def sponsor1 = new Sponsor(
//                    name: 'ACME Foods, Inc',
//                    address: '123 Wall Street Los Angeles CA 93456',
//                    phone: '1-800 123 4567',
//                    website: 'www.acmefoods.com',
//                    logo: new File("${superkids}/images/sustagrain.gif").readBytes(),
//                    salesContact: 'John Doe, jdoe@acmefoods.com 123-456-7890',
//                    sampleContact: 'Jane Smith jsmith@acmefoods.com 123-456-0987',
//                    products: []
//            ).save()
//
//            new Sponsor(
//                    name: 'Foo, Inc',
//                    address: '123 Wall Street Los Angeles CA, 93456',
//                    phone: '1-800 123 4567',
//                    website: 'www.acmefoods.com',
//                    logo: new File("${superkids}/images/ultragrain.gif").readBytes(),
//                    salesContact: 'John Doe, jdoe@acmefoods.com 123-456-7890',
//                    sampleContact: 'Jane Smith jsmith@acmefoods.com 123-456-0987',
//                    products: []
//            ).save()
//
//            new Product(
//                    name: 'Product 1',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    bake: true,
//                    sponsor: sponsor1
//            ).save(failOnError: true)
//
//            new Product(
//                    name: 'Product 2',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 3',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 4',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 5',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(), backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 6',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 7',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 8',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            def product9 = new Product(
//                    name: 'Product 9',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 10',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    parent: product9,
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 11',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    parent: product9,
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            new Product(
//                    name: 'Product 12',
//                    description: 'This is a description.',
//                    details: 'These are some details.',
//                    nutrition: 'Fat:0g, Sugar:0g',
//                    parent: product9,
//                    image: new File("${superkids}/uploads/product1.png").readBytes(),
//                    hoverImage: new File("${superkids}/uploads/product1-hover.png").readBytes(),
//                    backgroundImage: 'product1-background.png',
//                    summary: new File("${superkids}/uploads/product1.pdf").readBytes(),
//                    statesAvailable: statesAvailable,
//                    sponsor: sponsor1
//            ).save()
//
//            customer.save(failOnError: true)
//            customer2.save(failOnError: true)
//
//            def c = new Caller(username: "caller", password: springSecurityService.encodePassword("password"), enabled: true).save(failOnError: true)
//
//            UserRole.create customer, userRole, true
//            UserRole.create customer2, userRole, true
//            UserRole.create c, callerRole, true
//
//            def ptl = new PageTextLoader()
//            ptl.load()
//
//            new ShippingDate(shipDate: 'December, 2017').save()
//            new ShippingDate(shipDate: 'February, 2018').save()
//        }
    }


    def destroy = {
    }

}

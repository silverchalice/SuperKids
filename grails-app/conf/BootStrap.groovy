import com.superkids.domain.Customer
import com.superkids.domain.User
import com.superkids.domain.Product
import com.superkids.domain.Sponsor
import com.superkids.domain.Role
import com.superkids.domain.UserRole
import com.superkids.domain.Address
import com.superkids.domain.PageText
import com.superkids.domain.Caller
import com.superkids.domain.ShippingDate
import com.metasieve.shoppingcart.ShoppingItem
import com.superkids.domain.CustomerStatus
import com.superkids.domain.Factoid

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
			address:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'MO', zip:63136),
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
			studentsInDistrict: 12,
			facilities: 1,
			breakfastsServed: 12,
			lunchesServed: 12,
			snacksServed:12,
			hasBakery: false,
			purchaseFrozenBread: true,
			purchaseFreshBread: false,
			purchasePreparedFood: true,
			purchaseFrozenFood:true
		)

		def customer2 = new Customer(
			district:'Green Plate Schools',
			address:new Address(street:'62 Harneywold Drive', city:'St Louis', state:'MO', zip:63146),
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
			studentsInDistrict: 15,
			facilities: 2,
			breakfastsServed: 15,
			lunchesServed: 15,
			snacksServed: 15,
			hasBakery: false,
			purchaseFrozenBread: false,
			purchaseFreshBread: true,
			purchasePreparedFood: true,
			purchaseFrozenFood:true
		)

        def shoppingItem1 = new ShoppingItem().save()
        def shoppingItem2 = new ShoppingItem().save()
        def shoppingItem3 = new ShoppingItem().save()
        def shoppingItem4 = new ShoppingItem().save()
        def shoppingItem5 = new ShoppingItem().save()
        def shoppingItem6 = new ShoppingItem().save()
        def shoppingItem7 = new ShoppingItem().save()
        def shoppingItem8 = new ShoppingItem().save()
        def shoppingItem9 = new ShoppingItem().save()
        def shoppingItem10 = new ShoppingItem().save()
        def shoppingItem11 = new ShoppingItem().save()
        def shoppingItem12 = new ShoppingItem().save()

		def sponsor1 = new Sponsor(
			name:'ACME Foods, Inc',
			address: new Address(street:'123 Wall Street', city:'Los Angeles', state: 'CA', zip:93456),
			phone:'1-800 123 4567',
			website:'www.acmefoods.com',
                        logo:new File("${superkids}/web-app/images/sustagrain.gif").readBytes(),
			salesContact:'John Doe, jdoe@acmefoods.com 123-456-7890',
			sampleContact:'Jane Smith jsmith@acmefoods.com 123-456-0987',
			products:[]
		).save()

		def sponsor2 = new Sponsor(
			name:'Foo, Inc',
			address: new Address(street:'123 Wall Street', city:'Los Angeles', state: 'CA', zip:93456),
			phone:'1-800 123 4567',
			website:'www.acmefoods.com',
                        logo:new File("${superkids}/web-app/images/ultragrain.gif").readBytes(),
			salesContact:'John Doe, jdoe@acmefoods.com 123-456-7890',
			sampleContact:'Jane Smith jsmith@acmefoods.com 123-456-0987',
			products:[]
		).save()

		def product1 = new Product(
			name:'Product 1',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem1
		).save()

		def product2 = new Product(
			name:'Product 2',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem2
		).save()

		def product3 = new Product(
			name:'Product 3',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem3
		).save()

		def product4 = new Product(
			name:'Product 4',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem4
		).save()

		def product5 = new Product(
			name:'Product 5',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem5
		).save()

		def product6 = new Product(
			name:'Product 6',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem6
		).save()

		def product7 = new Product(
			name:'Product 7',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem7
		).save()

		def product8 = new Product(
			name:'Product 8',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem8
		).save()

		def product9 = new Product(
			name:'Product 9',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem9
		).save()

		def product10 = new Product(
			name:'Product 10',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem10
		).save()

		def product11 = new Product(
			name:'Product 11',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem11
		).save()

		def product12 = new Product(
			name:'Product 12',
			description:'This is a description.',
			details:'These are some details.',
			nutrition:'Fat:0g, Sugar:0g',
			image:new File("${superkids}/web-app/uploads/product1.png").readBytes(),
			summary:new File("${superkids}/web-app/uploads/product1.pdf").readBytes(),
			sponsor:sponsor1,
            shoppingItem:shoppingItem12
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

        def learnText = new PageText(name:"learn", content:"""
            <h1>Welcome to the 2009-2010 SuperKids Whole Grain Sampling Program.</h1> <p>The SuperKids program is your chance to try free samples of better-for-you, great-tasting whole grain foods from a variety of trusted companies.</p>
            <p>Across the country, elementary, junior and senior high schools in districts like yours are seeking ways to add more whole grains to their menus. Whole grains play a vital role in a healthy, balanced diet. In addition, students who eat more whole grains have been shown to stay full for longer periods of time, pay better attention in class, and maintain a healthier body weight.</p>
            <p>The USDA recommends 3 to 6 servings of whole grains daily, yet, the average school-age child in America consumes less than one serving of whole grains each day. The biggest reasons for this are taste and appearance. Historically whole grain foods did not look or taste like the foods students traditionally prefer.</p>
            <p>Two revolutionary ingredients, <strong>Ultragrain®</strong> whole wheat flour and <strong>Sustagrain®</strong> ultra-high fiber barley, are changing that perception. All of the products featured in the directory are made with one of these ingredients, ingredients that have been proven to have student appeal.</p>
            <p>Even if you have participated in the past, you don’t want to miss this opportunity to learn more about whole grain menu options made with <strong>Ultragrain®</strong> and <strong>Sustagrain®</strong> , see how schools are using these ingredients and products to make a difference, and, most importantly, try them for yourself, free of charge.</p>
            <p><strong>Use the menu on the left to learn more about the program.</strong></p>                        """
            ).save()

        def orderText = new PageText(name:"order", content:"""
            <h1>Order Your Free Samples</h1>
            <p><strong>Order Deadline: November 3, 2009 for samples to be delivered in November, 2009 and January 15, 2010 for those orders to be delivered in January, 2010.</strong></p>
            <h2>To Order Free Samples</h2>
            <p>1.  Mouse-over the pictures on the left to see each product's overview. <br />
            2.  Click on each product’s image to go to that product’s page, where you can request a sample, view product specifications and nutritional information, and download full product details. (After you order a sample, that product will be highlighted in <span style="color:green;">green</span>. Products still available for you to sample are not highlighted.) </p>
            <h2>Sample Availability</h2>
            <p>Samples will be delivered based upon availability at the time of your order and will be fulfilled while supplies last. Some samples require refrigeration or frozen storage. Packaging will only maintain products during shipment. A street address is required for all shipments. Be sure to verify that your contact information is correct. <strong>(Select 'Edit Profile' in the upper right corner to verify/change this information.)</strong></p>
            <h2>Rewards For Feedback</h2>
            <p>Your feedback is essential in helping us improve our products. In appreciation for providing an assessment of each product you sample by March 5, 2010, we'll enter your name in a sweepstakes drawing. You could win up to \$1,000 in travel accommodations to the School Nutrition Association's Annual National Conference or other rewards as well!  <strong>(See Assess Tab For Details.)</strong></p>
            <p><strong>Along with sending you an assessment form, we are also including posters provided by Learning ZoneXpress for you to display in your cafeterias.</strong></p>
                        """
            ).save()

        def assessText = new PageText(name:"assess", content:"""
            <h1>GET REWARDED JUST BY TELLING US WHAT YOU THINK!</h1>
            <p>Your feedback is invaluable; it lets us know how to improve the SuperKids program and helps manufacturers better understand your needs.</p>
            <p>After you receive your free samples and have tried them, tell us what you think by completing a short, five-question assessment for each product you tried. Do so by March 5, 2010, and you will earn the chance to win one of these special prizes:</p>
            <ol>
            <li><strong>TWO (2) First Place Prizes</strong> – \$1,000 for travel expenses and registration fees for SNA or other foodservice show in 2010.</li>
            <li><strong>THREE (3) Second Place Prizes</strong> – Three “OrganWise Guys Foods of the Month Club Kits,” which you can use as an educational resource in three of your school district cafeterias (\$885 value).</li>
            <li><strong>FIVE (5) Third Place Prizes</strong> – A \$200 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
            <li><strong>TEN (10) Fourth Place Prizes</strong> – A \$100 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
            <li><strong>THIRTY-THREE (33) Fifth Place Prizes</strong> – Missy Lapine’s <em>Sneaky Chef</em> paperback (\$16 value).</li>
            </ol>
            <p><strong>To get started, just click <g:link controller="home" action="index">here</a>, or on “Begin Online Assessment” in the menu. If you don’t finish, your progress will be saved so that you can come back later.</strong> </p>
                        """
            ).save()

        def promoteText = new PageText(name:"promote", content:"""
            <h1>Promote Whole Grain Nutrition</h1>
            <p>Promoting whole grain nutrition in our nation's schools is important. Whole grains improve health, ward off diseases, control weight, help school districts meet gold standards and more. This section includes resources you can use to spread the word about whole grain health, the SuperKids program, and your school's efforts to bolster nutrition.</p>
            <p><strong>Send An eCard</strong>—Send an eCard to other school districts or foodservice distributors/brokers to tell them about the SuperKids Whole Grain Product Sampling Program.</p>
            <p><strong>Promotional Tools & Resources</strong>—Includes letters, articles and a poster. Promote the importance of whole grain nutrition; request parental approval for child participation in taste tests; download three customizable articles for your school's newsletter.</p>
            <p><strong>Additional Promotional Ideas</strong>—Includes "Creative Nutrition Messaging In Your Lunchroom" from <em>The Learning Zone</em>, and more rewards available from The Whole Grains Council.</p>
            <p><strong>Select your choice from the Promote Menu Options on the left.</strong></p>

                        """
             ).save()

        def assessmentDrawingRulesText = new PageText(name:"assessment_drawing_rules", content:"""
            <h1>Assessment Drawing Rules</h1>
            <p><strong>How To Enter:</strong> No purchase necessary. One entry per school district. ConAgra Mills (”Sponsor”) is not responsible for lost, late or misdirected assessments not received in time for the random drawing.</p>
            <p><strong>Prizes</strong></p>
            <ol>
            <li><strong>TWO (2) First Place Prizes</strong> – \$1,000 for travel expenses and registration fees for SNA or other foodservice show in 2010.</li>
            <li><strong>THREE (3) Second Place Prizes</strong> – Three “OrganWise Guys Foods of the Month Club Kits,” which you can use as an educational resource in three of your school district cafeterias (\$885 value).</li>
            <li><strong>FIVE (5) Third Place Prizes</strong> – A \$200 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
            <li><strong>TEN (10) Fourth Place Prizes</strong> – A \$100 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
            <li><strong>THIRTY-THREE (33) Fifth Place Prizes</strong> – Missy Lapine’s <em>Sneaky Chef</em> paperback (\$16 value).</li>
            </ol>
            <p>By acceptance of prize, winner agrees to use of name and/or likeness for advertising and promotional purposes without additional compensation, unless prohibited by law. No prize transfers. If prize is unavailable, a prize of equal or greater value wil be substituted, at discretion of Sponsor. Winners may not elect to exchange the travel and accommodations award, or the OrganWise Guys award for their cash equivalent value.</p>
            <p><strong>Eligibility:</strong> Only foodservice professionals who have sampled products within the SuperKids Whole Grain Sampling Program (2010) are eligible. Employees and families of ConAgra Mills and participating food manufacturers, their subsidiaries or affiliated companies are not eligible. Void where prohibited or restricted by employer's policy. Participants must comply with their own school district's policy and/or directives regarding prize acceptance and must be employed by the school district at program's end. All federal, state and local laws apply.</p>
            <p><strong>Drawing:</strong> A random drawing will be held on March 8, 2010, by Sales Development Associates, the official sweepstakes administrator. Odds of winning will depend on the number of assessments received. You will be required to sign a Winner’s Affidavit and Release within ten business days of attempted delivery or the award will be forfeited. Winners will be notified by mail/phone. All taxes are the sole responsibility of winners. The decisions of Sponsor are final in all matters relating to this sweepstakes.</p>
            <p><strong>Winners’ List:</strong> Will be announced.</p>
            <p><strong>To get started, just click <g:link controller="home" action="index">here</g:link>, or on “Begin Online Assessment” in the menu. If you don’t finish, your progress will be saved so that you can come back later.</strong></p>

                        """
          ).save()

        def ecardsText = new PageText(name:"ecards", content:"""
            <h1>Send an eCard</h1>
            <p>eCards are available for foodservice distributors, brokers, or school foodservice directors. Click on the eCard of your choice. They're the easy way to spread the word about whole grain health and SuperKids.</p>
            <p><g:link controller="home" action="index">Foodservice Distributor or Broker eCard</g:link></p>
            <p><g:link controller="home" action="index">Foodservice Director eCard</g:link></p>
            <p><strong>Click on the options above.</strong></p>
                      """
          ).save()

        def promotionToolsAndResourcesText = new PageText(name:"promotion_tools_and_resources", content:"""
            <h1>Promotional Tools & Resources</h1>
            <p>Here are some support tools you can use to promote whole grain nutrition in your school or in your community. </p>
            <p><strong>Letters</strong> you can download and customize are available below. Click on your choice:</p>
            <ol>
            <li>To parents asking if their child can participate in taste tests: (MSWORD) Download</li>
            <li>To parents informing them about SuperKids in general: (MSWORD)  Download</li>
            </ol>
            <p><strong>Articles</strong> for your newsletter are available below. Click on your choice:</p>
            <ol>
            <li>Runner's World Advocates Whole Grain Nutrition: (MSWORD) <g:link controller="home" action="index">Download</g:link></li>
            <li>Student Athletes: Like Sports, Practice in Proper Eating = Champions: (MSWORD) <g:link controller="home" action="index">Download</g:link></li>
            <li>Importance of Whole Grains: (MSWORD) <g:link controller="home" action="index">Download</g:link></li>
            <p><strong>A Poster</strong> for school lunch rooms is available by clicking here: <g:link controller="home" action="index">Download</g:link></p>
                      """
           ).save()

        def additionalPromotionalIdeasText = new PageText(name:"additional_promotional_ideas", content:"""
            <h1>Assessment Tools & Resources</h1>
            <p>You can download the following by clicking on your choice. These tools and resources can be used when conducting in-school taste tests of your SuperKids whole grain product samples:</p>
            <br />
            <p><g:link controller="home" action="index">University of Minnesota Module</g:link> — Includes whole grain definitions, nutritional and labeling information.</p>
            <br />
            <p><g:link controller="home" action="index">Printable Assessment Form</g:link> — Download and print the assessment form. When complete, just fax or mail to the fax number or address provided.</p>
            <br />
            <p><g:link controller="home" action="index">Student Feedback Form</g:link> — This form was developed for use with younger students (K-3).</p>
            <br />
            <p><g:link controller="home" action="index">Student Certificate</g:link> — Download and print it, then give it to student taste-testers to recognize them for participating as a SuperKid.</p>
                      """
            ).save()

        def assessmentToolsText = new PageText(name:"assessment_tools", content:"""
            <h1>Assessment Tools & Resources</h1>
            <p>You can download the following by clicking on your choice. These tools and resources can be used when conducting in-school taste tests of your SuperKids whole grain product samples:</p>
            <br />
            <p><g:link controller="home" action="index">University of Minnesota Module</g:link> — Includes whole grain definitions, nutritional and labeling information.</p>
            <br />
            <p><g:link controller="home" action="index">Printable Assessment Form</g:link> — Download and print the assessment form. When complete, just fax or mail to the fax number or address provided.</p>
            <br />
            <p><g:link controller="home" action="index">Student Feedback Form</g:link> — This form was developed for use with younger students (K-3).</p>
            <br />
            <p><g:link controller="home" action="index">Student Certificate</g:link> — Download and print it, then give it to student taste-testers to recognize them for participating as a SuperKid.</p>
                          """
            ).save()

        def shippingDate1 = new ShippingDate(shipDate:new Date(110, 10, 01)).save()
        def shippingDate2 = new ShippingDate(shipDate:new Date(111, 01, 01)).save()

        def f1 = new Factoid(content:"Whole wheat is good for you.").save()
        def f2 = new Factoid(content:"Whole wheat is not bad for you.").save()
        def f3 = new Factoid(content:"Eating whole wheat helps reduce your risk of not eating whole wheat.* <br /><br /><span style='font-size:xx-small'>(*The American Association Of Those Who Determine Such Things has determined that eating whole wheat helps to reduce the risk of not eating whole wheat, as part of a diet high in whole wheat.)</span>").save()
        def f4 = new Factoid(content:"Who said that whole wheat wasn't good for you?").save()
        def f5 = new Factoid(content:"Who said that whole wheat was bad for you?").save()

    }




    def destroy = {
    }

}

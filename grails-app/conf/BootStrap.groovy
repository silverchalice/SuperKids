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
import grails.util.GrailsUtil


class BootStrap {
    def springSecurityService
    def init = { servletContext ->




	//		def superkids = '/Users/zak/builds/SuperKids'
			def superkids = '/home/ben/dev/SuperKids'
	//		def superkids = '/opt/tomcat/webapps/SuperKids'

  		
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(failOnError:true, flush: true)
		def userRole = new Role(authority: 'ROLE_USER').save(failOnError:true, flush: true)
                def callerRole = new Role(authority: 'ROLE_CALLER').save(failOnError:true, flush:true)

		String password = springSecurityService.encodePassword('superkids')
	        String password2 = springSecurityService.encodePassword('superkids')
		def testUser = new User(username: 'admin', enabled: true, password: password)
		testUser.save(failOnError:true, flush: true)
		UserRole.create testUser, adminRole, true

		def customer = new Customer(
			district:'Silver Chalice Schools',
			address:new Address(street:'61 Harneywold Drive', city:'St Louis', state:'MO', zip:63136),
			phone:'(608) 617-3960',
			email:'info@silver-chalice.com',
			username:'info@silver-chalice.com',
			password:password2,
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
                sponsor2.addToProducts(product3)
                sponsor2.addToProducts(product4)

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
            <h1>Welcome To The 2010-2011 SuperKids Whole Grain Sampling Program</h1>
            <p>More and more, elementary and high schools in districts like yours are searching for food choices that are not only great-tasting, but healthier and more beneficial for kids.  And the chance to try free samples of better-for-you whole grain foods is what makes the SuperKids Whole Grain Sampling Program so timely and appealing to many Foodservice Directors.</p>
            <p>The fact is, whole grain consumption not only plays a vital role in a balanced diet, it’s a powerful strategy in the battle against growing childhood obesity and other diseases.  Students who eat more whole grains, for example, have been shown to maintain a healthier body weight, stay full for longer periods of time, as well as pay better attention in class.</p>
            <p>The USDA recommends 3 to 6 servings of whole grains daily, yet, the average school-age child in America consumes less than one serving of whole grains each day.  Taste and appearance seem to be the reasons why.  Typically, whole grain foods don’t look or taste like foods students prefer, but two revolutionary ingredients—Ultragrain® whole wheat flour and Sustagrain® ultra-high fiber barley—are changing that perception.  As you’ll see, all the products featured in the directory are made with one of these all-natural ingredients—ingredients with proven student appeal.</p>
            <p>So even if you’ve participated in the past, be sure not to miss this opportunity to learn more about healthier, whole grain menu options made with Ultragrain and Sustagrain.  The program is absolutely <strong><em>free</em></strong> and gives you the opportunity to share feedback on products you sample.  Best of all, it’s your chance to see how to use these ingredients and products to make a real difference in your district’s student health and nutrition.</p>
             <p><em>Use the menu on the left to learn more about the program.</em></p>
                        """
            ).save()

        def orderText = new PageText(name:"order", content:"""
            <h1>Order Your Free Samples</h1>
            <p><strong>Order Deadline: October 30, 2010 for samples to be delivered in November, 2010 and January 7, 2010 for those orders to be delivered in January, 2010.</strong></p>
            <h2>To Order Free Samples</h2>
            <p>1.  Mouse-over the pictures on the left to see each product's overview. <br />
            2.  Click on each product’s image to go to that product’s page, where you can request a sample, view product specifications and nutritional information, and download full product details. (After you order a sample, that product will be highlighted in <span style="color:green;">green</span>. Products still available for you to sample are not highlighted.) </p>
            <h2>Sample Availability</h2>
            <p>Samples will be delivered based upon availability at the time of your order and will be fulfilled while supplies last. Some samples require refrigeration or frozen storage. Packaging will only maintain products during shipment. A street address is required for all shipments. Be sure to verify that your contact information is correct. <strong>(Select 'Edit Profile' in the upper right corner to verify/change this information.)</strong></p>
            <h2>Rewards For Feedback</h2>
            <p>Your feedback is essential in helping us improve our products. In appreciation for providing an assessment of each product you sample by March 9, 2011, we'll enter your name in a sweepstakes drawing. You could win a \$100 or \$200 Gift Card to Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys.  <em>(See “Assess” tab for more details.)</em></p>
                        """
            ).save()

        def assessText = new PageText(name:"assess", content:"""
            <h1>GET REWARDED JUST BY TELLING US WHAT YOU THINK!</h1>
            <p>Your feedback is invaluable; it lets us know how to improve the SuperKids program and helps manufacturers better understand your needs.  After you’ve received and tried your free samples, please give us your feedback by completing the short five-question survey.  Do so between November 15, 2010 and March 9, 2011, and you’ll earn the chance to win one of these special prizes:</p>
            <ul>
                <li>FIVE (5) First Place Prizes--\$200 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>
                <li>SEVEN (7) Second Place Prizes--\$100 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>
            </ul>
            <p>When you receive your samples, a printed Assessment Form will be included in the box.  Complete it, then fax or mail it back and you’ll be automatically entered in our drawing.  If you fill out the assessment form online you’ll double your chances to win one of our sweepstakes prizes!</p>
            <p><em>To get started, just <a href="/SuperKids/assessment/assessment_process">click here</a>, or on “Begin Online Assessment” in the menu.  If you don’t finish, your progress will be saved so that you can come back later.</em></p>
                        """
            ).save()

        def promoteText = new PageText(name:"promote", content:"""
            <h1>Promote Whole Grain Nutrition</h1>
            <p>Promoting whole grain nutrition in our nation's schools is important. Whole grains improve health, ward off diseases, control weight, help school districts meet gold standards and more. This section includes resources you can use to spread the word about whole grain health, the SuperKids program, and your school's efforts to bolster nutrition.</p>
            <p><strong>Send An eCard</strong>—Send an eCard to other school districts or foodservice distributors/brokers to tell them about the SuperKids Whole Grain Product Sampling Program.</p>
            <p><strong>Promotional Tools & Resources</strong>—Includes letters, articles and a poster. Promote the importance of whole grain nutrition; request parental approval for child participation in taste tests; download three customizable articles for your school's newsletter.</p>
            <p><strong>Additional Promotional Ideas</strong>—Includes "Creative Nutrition Messaging In Your Lunchroom" from <em>The Learning Zone</em>, and more rewards available from The Whole Grains Council.</p>
            <h2>Educational Partner Materials</h2>
            <p>In addition, to help you promote healthier eating habits with students and their parents, you’ll have access to invaluable educational tools from four partners in our program: The Whole Grains Council, Alliance for a Healthier Generation, Learning ZoneXpress and The OrganWise Guys.  <em>(<strong><a href="#">Click here</a><strong> for details on specific tools available as well as contact and ordering information.)</em> </p>
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

        def whatIsText = new PageText(name:"what_is", content:"""
            <h1>What Is SuperKids?</h1>
            <p>SuperKids is a unique school foodservice program that offers free samples of whole grain and high-fiber snack, breakfast and lunch menu options that students will love.  This year’s program includes great-tasting products designed specifically for K-12 students from these manufacturers:</p>
            <h2>SuperKids is the only product sampling program of its kind that:</h2>
            <ul>
                <li>Lets you choose the whole grain and high-fiber products you’d like to try</li>
                <li>Notifies you via e-mail when your samples are going to ship</li>
                <li>Delivers the samples directly to you so that you can evaluate them on your own ahead of the bid season</li>
                <li>Solicits your input for product improvements and new products</li>
                <li>Includes resources to promote whole grain nutrition</li>
                <li>Offers rewards for timely feedback</li>
                <li>Provides tools to help you promote your district’s whole grain success</li>
                <li>Is completely free to you courtesy of ConAgra Mills and the manufacturers who participate in the program</li>
                <li>Provides access to Partner Educational Materials to help your school promote healthier eating habits</li>
            </ul>
                          """
            ).save()

        def testimonialsText = new PageText(name:"testimonials", content:"""
            <h1>Testimonials</h1>
            <h2>Here’s what we’ve heard from Foodservice Directors like you!</h2>
            <p>"I am so pleased that there are finally whole grain convenience foods that are healthy and delicious being offered for school foodservice, as well as whole grain flours!" <strong>– Medford, MA</strong></p>
            <p>"I appreciate the fact that you are trying to make whole grain products that are kid friendly. It’s nice to be able to get samples so easily." <strong>– Kansas City, MO</strong></p>
            <p>"The nutritional information was great. The amounts of the product that you sent was a good amount to give a large group of students samples. Your products are a great way to increase whole grains on our menu and raise participation." <strong>– Longmeadow, MA</strong></p>
            <p>"This is a great program. It gives me an opportunity to taste test multiple products at one time with my students." <strong>– Watertown, WI</strong></p>
            <p>"I like getting the samples to offer to the kids. Always looking for new menu items. Keep new products coming." <strong>– Millford, DE</strong></p>
            <p>"Very good program. Please keep it in place. It allows us to try a small amount of product without a lot of hassle. Thank you!" <strong>– Willmar, MN</strong></p>
            <p>"The students really enjoyed being able to try a product before it is put on the menu." <strong>– Afton, WY</strong></p>
            <p>“I loved these products because when questioned regarding the healthiness of school lunches I can tell people we serve these whole grain foods.” <strong>– (Parma, OH)</strong></p> 
            <p>“The cooks that help with the sampling were pleased with the fact that kids can be served whole grains and not even realize it.  With items such as these, we’re not compromising the taste to serve them whole grains.”  <strong>– (Weston, WV)</strong></p>
            <p>“It’s a very good program.  It lets us taste new and upcoming healthy items.” <strong>– (Dunlap, IL)</strong></p>
            <p>“As an industry, we should be looking at these and more products that include whole grains. Thank you for the opportunity to sample these products.” 
<strong>– (Quartz Hill, CA)</strong></p>
            <p>“This program’s a great help to schools by developing  these products using whole grains.  I’ve shared this info with our Wellness Committee.” <strong>– (Lafayette, IN)</strong></p>
            <p>“The pasta products were my favorite.  I liked the taste and firm texture after they were cooked.”  <strong>– (Jefferson, NC)</strong></p>
            <p>“We need to educate our students and serve them more whole grain.  I was amazed how many products are available.”  <strong>– (Brainerd, MN)</strong></p>
                          """
            ).save()

        def childhoodObesityText = new PageText(name:"childhood_obesity", content:"""
            <h1>The Challenge of Growing Childhood Obesity</h1>
            <p>Across the country, childhood obesity remains a growing problem for school districts. Consider these alarming statistics:</p>
            <ul>
                <li>According to a report from the Center for Disease Control and Prevention (CDC), 80% of children overweight at ages 10-15 were also obese at age 25.</li>
                <li>The Journal of the American Dietary Association reports that “Nearly 23 million children and teens are either overweight or obese.”</li>
                <li>School nutrition is critical as 40% of children’s daily intake occurs at school.</li>
            </ul>
            <p>The good news is it appears whole grain consumption can be a key factor in helping to reverse the growing childhood obesity problem.  In addition, physical activity and school nutrition continue to play pivotal roles in the health and well-being of our nation’s students.</p>

            <h2>Helping Schools Meet the Challenge with Healthier Whole Grain Choices</h2>
            <p>The reality is, whole grain consumption delivers significant health benefits for school students.  For that reason, the USDA, American Heart Association, and Department of Health and Human Services generally agree that children ages 4-18 should eat between 3 and 6 servings of whole grains daily.  Unfortunately, the average school-age child in America eats less than one serving of whole grain foods each day.</p>
            <p>By offering healthier and great-tasting whole grain food products, SuperKids provides an efficient way to help our nation’s students reach the recommended daily nutrition levels, while promoting healthier eating habits at school and home.</p>
                          """
            ).save()

        def wholeGrainStudiesText = new PageText(name:"whole_grain_studies", content:"""
<h1>Whole Grains & Human Health</h1>
<p>As a nutrition professional, you're well aware of the food pyramid and the role that whole grains play in health and wellness. This section provides access to some of the many recent health studies for your reference.</p>
<h2>A Detailed Study.</h2>
<p>Dr. Joanne Slavin of the University of Minnesota has reviewed and compiled scores of recent studies to show how whole grain intake protects against cancer, cardiovascular disease, diabetes and obesity. Click here to access it:  <a href="#">Download PDF (454K)</a>  <strong>(Nutrition Research Reviews, May 2004; Vol 17: 99-110.)</strong></p>
<h2>Quick Highlights.</h2>
<p>Select your choice from this menu for highlights of recent studies. <strong>(Courtesy: The Whole Grains Council.)</strong> </p>
    <li><a onclick="popup('PopUp1');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Less Acne</span></strong></a></li> 
    <li><a onclick="popup('PopUp2');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Chronic Disease Risk</span></strong></a></li> 
    <li><a onclick="popup('PopUp3');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Lower Body Mass Index(BMI)</span></strong></a></li> 
    <li><a onclick="popup('PopUp4');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Pancreatic Cancer&nbsp;</span></strong></a></li> 
    <li><a onclick="popup('PopUp5');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Healthier Hearts</span></strong></a></li> 
    <li><a onclick="popup('PopUp6');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Hypertension Risk</span></strong></a></li> 
    <li><a onclick="popup('PopUp7');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Diabetes Risks</span></strong></a></li> 
    <li><a onclick="popup('PopUp8');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Healthier Carotid Arteries</span></strong></a></li> 
    <li><a onclick="popup('PopUp9');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Colorectal Cancer</span></strong></a></li> 
    <li><a onclick="popup('PopUp10');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Breast Cancer</span></strong></a></li> 
    <li><a onclick="popup('PopUp11');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Childhood Asthma</span></strong></a><a onclick="popup('PopUp12');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);"><br /> 
    </span></strong></a></li> 
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

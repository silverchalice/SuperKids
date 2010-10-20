package com.superkids

import com.superkids.domain.PageText
/**
 * Created by IntelliJ IDEA.
 * User: zak
 * Date: Oct 19, 2010
 * Time: 5:17:51 PM
 * To change this template use File | Settings | File Templates.
 */
class PageTextLoader {


		def load() {

			def brokerText = new PageText(name:"broker", content:"""
				<h1>SuperKids Program Overview</h1>  <br/>  <img id="kid2" src="/SuperKids/images/NEWGIRLeatingpizzaVERTICAL.jpg" alt="">  <p>SuperKids gives foodservice directors free samples of whole grain products from a variety of trusted food companies and bakeries. All products are made with Ultragrain<sup>&reg; </sup>and/or Sustagrain<sup>&reg;</sup>. Sample products are free and come with no purchase obligation.</p>  <p>SuperKids asks for foodservice director feedback on how they liked the products. This feedback (in the form of trial assessment data) will be used by our food manufacturers to develop new products. In addition, we use it to report demand to foodservice distributors and brokers like you.</p>  <p><strong style="color:#993300; font-size:16px;">We can prove high acceptance of whole grain products in our nation's schools.</strong> SuperKids is in its fourth year. Last year, over 1,284 of the largest public school districts in America requested and received 6,079 product samples from a pool of 16 products made with Ultragrain. In independent studies, elementary school students consumed products made with Ultragrain at the same levels as products made with refined flour. The difference is Ultragrain's taste, look and texture. It's revolutionary, innovative, and a major technological breakthrough.</p>  <p><strong style="color:#993300; font-size:16px;">Ultragrain: Whole Grain Nutrition. White Flour Appeal.</strong> Ultragrain makes it possible for students to receive higher amounts of fiber, along with the full nutritive value of whole grains in foods they are familiar with and love. With Ultragrain, students don't notice changes in color, taste or texture that they often complain about when eating foods that use traditional whole grain flour.</p>  <p><strong style="color:#993300; font-size:16px;">Sustragrain: The Ultra High-Fiber Whole Grain.</strong> SuperKids products made with Sustagrain offer another way to increase whole grain and fiber consumption in school lunches. In flour form, Sustagrain can be used in baked goods, meat preparations, sauces and dips. In flake form, it works great in hot cereals, snacks, desserts and toppings. <strong>Select your choice from the menu options on the left.</strong></p>
				""").save()

			def brokerProductsText = new PageText(name:"broker_products", content:"""
				<div style="width:445px;"> <h1>SuperKids Program Overview</h1>  <br/>  <p><span style="font-size: x-large;"><span style="color: rgb(153, 51, 0);"><strong><span class="bu"><img id="kid3" src="/SuperKids/images/NEWGIRLeatingpizzaVERTICAL.jpg" alt=""></span></strong></span></span><span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;">SuperKids gives foodservice directors free samples of whole grain products from a variety of trusted food companies and bakeries. All products are made with Ultragrain<sup>&reg; </sup>and/or Sustagrain<sup>&reg;</sup>.&nbsp;Sample products are&nbsp;free and come with no purchase obligation.</span></span></p>  <p><span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;">SuperKids asks for foodservice director feedback on how they liked the products. This feedback (in the form of trial assessment data) will be used by our food manufacturers to develop new products. In addition, we use it to report demand to foodservice distributors and brokers&nbsp;like you.</span></span></p>  <p><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>We can prove high acceptance of whole grain products in our nation's schools.</strong></span></span>&nbsp;&nbsp;<span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;">SuperKids is in its fourth year. Last year, over 1,284 of the largest public school districts in America requested and received 6,079 product samples from a pool of 16 products made with Ultragrain.&nbsp;In independent studies, elementary school students consumed products made with Ultragrain at the same levels as&nbsp;products made with refined flour.&nbsp;The difference&nbsp;is Ultragrain's taste, look and texture.&nbsp;It's revolutionary, innovative, and a major technological breakthrough.</span></span></p>  <p><span style="font-size: medium;"><span><strong><span style="color: rgb(153, 51, 0);">Ultragrain: Whole Grain Nutrition. White Flour Appeal.</span></strong></span></span><span style="font-size: medium;"><strong><span style="color: rgb(153, 51, 0);">&nbsp;</span></strong></span><span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;">Ultragrain makes it possible for students to receive higher amounts of fiber, along with the full nutritive value of whole grains in foods they are familiar with and love. With Ultragrain, students don't notice changes in color, taste or texture that they often complain about when eating foods that use traditional whole grain flour.</span></span></p>  <p><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><span><strong>Sustragrain:&nbsp;The Ultra High-Fiber Whole Grain.</strong></span></span><span style="font-size: medium;"><strong> </strong></span></span><span style="color: rgb(0, 0, 0);"><span><span style="font-size: x-small;">Known for its great taste and healthful properties, Sustagrain is a great way to add more fiber into a range of recipes. <span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">SuperKids products made with Sustagrain offer another way to increase whole grain and&nbsp;fiber consumption in school lunches.&nbsp;In flour form, Sustagrain can be&nbsp;used in baked goods, meat preparations, sauces and dips.&nbsp;In&nbsp;flake form, it works great in hot cereals, snacks, desserts and toppings.&nbsp;</span></span></span></span></span><span style="color: rgb(153, 51, 0);"><span style="font-size: xx-small;"><strong>Select your choice from the menu options on the left.&nbsp;</strong></span></span></p> </div>
				""" ).save()


			def learnText = new PageText(name:"learn", content:"""
				<h1>Welcome To The 2010-2011 SuperKids Whole Grain Sampling Program</h1>  <p>More and more, elementary and high schools in districts like yours are searching for food choices that are not only great-tasting, but healthier and more beneficial for kids. And the chance to try free samples of better-for-you whole grain foods is what makes the SuperKids Whole Grain Sampling Program so timely and appealing to many Foodservice Directors.</p>  <p>The fact is, whole grain consumption not only plays a vital role in a balanced diet, it&rsquo;s a powerful strategy in the battle against growing childhood obesity and other diseases. Students who eat more whole grains, for example, have been shown to maintain a healthier body weight, stay full for longer periods of time, as well as pay better attention in class.</p>  <p>The USDA recommends 3 to 6 servings of whole grains daily, yet, the average school-age child in America consumes less than one serving of whole grains each day. Taste and appearance seem to be the reasons why. Typically, whole grain foods don&rsquo;t look or taste like foods students prefer, but two revolutionary ingredients-Ultragrain&reg; whole wheat flour and Sustagrain&reg; ultra-high fiber barley-are changing that perception. As you&rsquo;ll see, all the products featured in the directory are made with one of these all-natural ingredients-ingredients with proven student appeal.</p>  <p>So even if you&rsquo;ve participated in the past, be sure not to miss this opportunity to learn more about healthier, whole grain menu options made with Ultragrain and Sustagrain. The program is absolutely <strong><em>free</em></strong> and gives you the opportunity to share feedback on products you sample. Best of all, it&rsquo;s your chance to see how to use these ingredients and products to make a real difference in your district&rsquo;s student health and nutrition.</p>  <p><em>Use the menu on the left to learn more about the program.</em></p>
							""").save()

			def orderText = new PageText(name:"order", content:"""
				<h1>Order Your Free Samples</h1>
				<p><strong>Order Deadline: October 30, 2010 for samples to be delivered in November, 2010 and January 7, 2010 for those orders to be delivered in January, 2010.</strong></p>
				<h2>To Order Free Samples</h2>
				<p>1.  Mouse-over the pictures on the left to see each product's overview. <br />
				2.  Click on each product&rsquo;s image to go to that product&rsquo;s page, where you can request a sample, view product specifications and nutritional information, and download full product details. (After you order a sample, that product will be highlighted in <span style="color:green;">green</span>. Products still available for you to sample are not highlighted.) </p>
				<h2>Sample Availability</h2>
				<p>Samples will be delivered based upon availability at the time of your order and will be fulfilled while supplies last. Some samples require refrigeration or frozen storage. Packaging will only maintain products during shipment. A street address is required for all shipments. Be sure to verify that your contact information is correct. <strong>(Select 'Edit Profile' in the upper right corner to verify/change this information.)</strong></p>
				<h2>Rewards For Feedback</h2>
				<p>Your feedback is essential in helping us improve our products. In appreciation for providing an assessment of each product you sample by March 9, 2011, we'll enter your name in a sweepstakes drawing. You could win a \$100 or \$200 Gift Card to Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys.  <em>(See &ldquo;Assess&rdquo; tab for more details.)</em></p>
							"""
				).save()

			def assessText = new PageText(name:"assess", content:"""
				<h1>GET REWARDED JUST BY TELLING US WHAT YOU THINK!</h1>
				<p>Your feedback is invaluable; it lets us know how to improve the SuperKids program and helps manufacturers better understand your needs.  After you&rsquo;ve received and tried your free samples, please give us your feedback by completing the short five-question survey.  Do so between November 15, 2010 and March 9, 2011, and you&rsquo;ll earn the chance to win one of these special prizes:</p>
				<ul>
					<li>FIVE (5) First Place Prizes--\$200 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>
					<li>SEVEN (7) Second Place Prizes--\$100 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>
				</ul>
				<p>When you receive your samples, a printed Assessment Form will be included in the box.  Complete it, then fax or mail it back and you&rsquo;ll be automatically entered in our drawing.  If you fill out the assessment form online you&rsquo;ll double your chances to win one of our sweepstakes prizes!</p>
				<p><em>To get started, just <a href="/SuperKids/assessment/assessment_process">click here</a>, or on &ldquo;Begin Online Assessment&rdquo; in the menu.  If you don&rsquo;t finish, your progress will be saved so that you can come back later.</em></p>
							"""
				).save()

			def promoteText = new PageText(name:"promote", content:"""
				<h1>Promote Whole Grain Nutrition</h1>  <p>Promoting whole grain nutrition in our nation's schools is important. Whole grains improve health, ward off diseases, control weight, help school districts meet gold standards and more. This section includes resources you can use to spread the word about whole grain health, the SuperKids program, and your school's efforts to bolster nutrition.</p>  <p><strong>Send An eCard</strong>-Send an eCard to other school districts or foodservice distributors/brokers to tell them about the SuperKids Whole Grain Product Sampling Program.</p>  <p><strong>Promotional Tools & Resources</strong>-Includes letters, articles and a poster. Promote the importance of whole grain nutrition; request parental approval for child participation in taste tests; download three customizable articles for your school's newsletter.</p>  <p><strong>Additional Promotional Ideas</strong>-Includes "Creative Nutrition Messaging In Your Lunchroom" from <em>The Learning Zone</em>, and more rewards available from The Whole Grains Council.</p>  <h2>Educational Partner Materials</h2>  <p>In addition, to help you promote healthier eating habits with students and their parents, you&rsquo;ll have access to invaluable educational tools from four partners in our program: The Whole Grains Council, Alliance for a Healthier Generation, Learning ZoneXpress and The OrganWise Guys. <em>(<strong><a href="#">Click here</a></strong> for details on specific tools available as well as contact and ordering information.)</em> </p>  <p><strong>Select your choice from the Promote Menu Options on the left.</strong></p>
				""" ).save()

			def assessmentDrawingRulesText = new PageText(name:"assessment_drawing_rules", content:"""
				<h1>Assessment Drawing Rules</h1>
				<p><strong>How To Enter:</strong> No purchase necessary. One entry per school district. ConAgra Mills (&rdquo;Sponsor&rdquo;) is not responsible for lost, late or misdirected assessments not received in time for the random drawing.</p>
				<p><strong>Prizes</strong></p>
				<ol>
				<li><strong>TWO (2) First Place Prizes</strong> - \$1,000 for travel expenses and registration fees for SNA or other foodservice show in 2010.</li>
				<li><strong>THREE (3) Second Place Prizes</strong> - Three &ldquo;OrganWise Guys Foods of the Month Club Kits,&rdquo; which you can use as an educational resource in three of your school district cafeterias (\$885 value).</li>
				<li><strong>FIVE (5) Third Place Prizes</strong> - A \$200 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
				<li><strong>TEN (10) Fourth Place Prizes</strong> - A \$100 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
				<li><strong>THIRTY-THREE (33) Fifth Place Prizes</strong> - Missy Lapine&rsquo;s <em>Sneaky Chef</em> paperback (\$16 value).</li>
				</ol>
				<p>By acceptance of prize, winner agrees to use of name and/or likeness for advertising and promotional purposes without additional compensation, unless prohibited by law. No prize transfers. If prize is unavailable, a prize of equal or greater value wil be substituted, at discretion of Sponsor. Winners may not elect to exchange the travel and accommodations award, or the OrganWise Guys award for their cash equivalent value.</p>
				<p><strong>Eligibility:</strong> Only foodservice professionals who have sampled products within the SuperKids Whole Grain Sampling Program (2010) are eligible. Employees and families of ConAgra Mills and participating food manufacturers, their subsidiaries or affiliated companies are not eligible. Void where prohibited or restricted by employer's policy. Participants must comply with their own school district's policy and/or directives regarding prize acceptance and must be employed by the school district at program's end. All federal, state and local laws apply.</p>
				<p><strong>Drawing:</strong> A random drawing will be held on March 8, 2010, by Sales Development Associates, the official sweepstakes administrator. Odds of winning will depend on the number of assessments received. You will be required to sign a Winner&rsquo;s Affidavit and Release within ten business days of attempted delivery or the award will be forfeited. Winners will be notified by mail/phone. All taxes are the sole responsibility of winners. The decisions of Sponsor are final in all matters relating to this sweepstakes.</p>
				<p><strong>Winners&rsquo; List:</strong> Will be announced.</p>
				<p><strong>To get started, just click <g:link controller="home" action="index">here</g:link>, or on &ldquo;Begin Online Assessment&rdquo; in the menu. If you don&rsquo;t finish, your progress will be saved so that you can come back later.</strong></p>

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
				<p><g:link controller="home" action="index">University of Minnesota Module</g:link> - Includes whole grain definitions, nutritional and labeling information.</p>
				<br />
				<p><g:link controller="home" action="index">Printable Assessment Form</g:link> - Download and print the assessment form. When complete, just fax or mail to the fax number or address provided.</p>
				<br />
				<p><g:link controller="home" action="index">Student Feedback Form</g:link> - This form was developed for use with younger students (K-3).</p>
				<br />
				<p><g:link controller="home" action="index">Student Certificate</g:link> - Download and print it, then give it to student taste-testers to recognize them for participating as a SuperKid.</p>
						  """
				).save()

			def assessmentToolsText = new PageText(name:"assessment_tools", content:"""
				<h1>Assessment Tools & Resources</h1>
				<p>You can download the following by clicking on your choice. These tools and resources can be used when conducting in-school taste tests of your SuperKids whole grain product samples:</p>
				<br />
				<p><g:link controller="home" action="index">University of Minnesota Module</g:link> - Includes whole grain definitions, nutritional and labeling information.</p>
				<br />
				<p><g:link controller="home" action="index">Printable Assessment Form</g:link> - Download and print the assessment form. When complete, just fax or mail to the fax number or address provided.</p>
				<br />
				<p><g:link controller="home" action="index">Student Feedback Form</g:link> - This form was developed for use with younger students (K-3).</p>
				<br />
				<p><g:link controller="home" action="index">Student Certificate</g:link> - Download and print it, then give it to student taste-testers to recognize them for participating as a SuperKid.</p>
							  """
				).save()

			def whatIsText = new PageText(name:"what_is", content:"""
				<h1>What Is SuperKids?</h1>
				<p>SuperKids is a unique school foodservice program that offers free samples of whole grain and high-fiber snack, breakfast and lunch menu options that students will love.  This year&rsquo;s program includes great-tasting products designed specifically for K-12 students from these manufacturers:</p>
				<h2>SuperKids is the only product sampling program of its kind that:</h2>
				<ul>
					<li>Lets you choose the whole grain and high-fiber products you&rsquo;d like to try</li>
					<li>Notifies you via e-mail when your samples are going to ship</li>
					<li>Delivers the samples directly to you so that you can evaluate them on your own ahead of the bid season</li>
					<li>Solicits your input for product improvements and new products</li>
					<li>Includes resources to promote whole grain nutrition</li>
					<li>Offers rewards for timely feedback</li>
					<li>Provides tools to help you promote your district&rsquo;s whole grain success</li>
					<li>Is completely free to you courtesy of ConAgra Mills and the manufacturers who participate in the program</li>
					<li>Provides access to Partner Educational Materials to help your school promote healthier eating habits</li>
				</ul>
							  """
				).save()

			def testimonialsText = new PageText(name:"testimonials", content:"""
				<h1>Testimonials</h1>
				<h2>Here&rsquo;s what we&rsquo;ve heard from Foodservice Directors like you!</h2>
				<p>"I am so pleased that there are finally whole grain convenience foods that are healthy and delicious being offered for school foodservice, as well as whole grain flours!" <strong>- Medford, MA</strong></p>
				<p>"I appreciate the fact that you are trying to make whole grain products that are kid friendly. It&rsquo;s nice to be able to get samples so easily." <strong>- Kansas City, MO</strong></p>
				<p>"The nutritional information was great. The amounts of the product that you sent was a good amount to give a large group of students samples. Your products are a great way to increase whole grains on our menu and raise participation." <strong>- Longmeadow, MA</strong></p>
				<p>"This is a great program. It gives me an opportunity to taste test multiple products at one time with my students." <strong>- Watertown, WI</strong></p>
				<p>"I like getting the samples to offer to the kids. Always looking for new menu items. Keep new products coming." <strong>- Millford, DE</strong></p>
				<p>"Very good program. Please keep it in place. It allows us to try a small amount of product without a lot of hassle. Thank you!" <strong>- Willmar, MN</strong></p>
				<p>"The students really enjoyed being able to try a product before it is put on the menu." <strong>- Afton, WY</strong></p>
				<p>&ldquo;I loved these products because when questioned regarding the healthiness of school lunches I can tell people we serve these whole grain foods.&rdquo; <strong>- (Parma, OH)</strong></p>
				<p>&ldquo;The cooks that help with the sampling were pleased with the fact that kids can be served whole grains and not even realize it.  With items such as these, we&rsquo;re not compromising the taste to serve them whole grains.&rdquo;  <strong>- (Weston, WV)</strong></p>
				<p>&ldquo;It&rsquo;s a very good program.  It lets us taste new and upcoming healthy items.&rdquo; <strong>- (Dunlap, IL)</strong></p>
				<p>&ldquo;As an industry, we should be looking at these and more products that include whole grains. Thank you for the opportunity to sample these products.&rdquo;
				<strong>- (Quartz Hill, CA)</strong></p>
				<p>&ldquo;This program&rsquo;s a great help to schools by developing  these products using whole grains.  I&rsquo;ve shared this info with our Wellness Committee.&rdquo; <strong>- (Lafayette, IN)</strong></p>
				<p>&ldquo;The pasta products were my favorite.  I liked the taste and firm texture after they were cooked.&rdquo;  <strong>- (Jefferson, NC)</strong></p>
				<p>&ldquo;We need to educate our students and serve them more whole grain.  I was amazed how many products are available.&rdquo;  <strong>- (Brainerd, MN)</strong></p>
							  """
				).save()

			def childhoodObesityText = new PageText(name:"childhood_obesity", content:"""
				<h1>The Challenge of Growing Childhood Obesity</h1>
				<p>Across the country, childhood obesity remains a growing problem for school districts. Consider these alarming statistics:</p>
				<ul>
					<li>According to a report from the Center for Disease Control and Prevention (CDC), 80% of children overweight at ages 10-15 were also obese at age 25.</li>
					<li>The Journal of the American Dietary Association reports that &ldquo;Nearly 23 million children and teens are either overweight or obese.&rdquo;</li>
					<li>School nutrition is critical as 40% of children&rsquo;s daily intake occurs at school.</li>
				</ul>
				<p>The good news is it appears whole grain consumption can be a key factor in helping to reverse the growing childhood obesity problem.  In addition, physical activity and school nutrition continue to play pivotal roles in the health and well-being of our nation&rsquo;s students.</p>

				<h2>Helping Schools Meet the Challenge with Healthier Whole Grain Choices</h2>
				<p>The reality is, whole grain consumption delivers significant health benefits for school students.  For that reason, the USDA, American Heart Association, and Department of Health and Human Services generally agree that children ages 4-18 should eat between 3 and 6 servings of whole grains daily.  Unfortunately, the average school-age child in America eats less than one serving of whole grain foods each day.</p>
				<p>By offering healthier and great-tasting whole grain food products, SuperKids provides an efficient way to help our nation&rsquo;s students reach the recommended daily nutrition levels, while promoting healthier eating habits at school and home.</p>
							  """
				).save()

			def wholeGrainBenefitsText = new PageText(name:"whole_grain_benefits", content:"""
				<div class="headline2"><span style="font-size: x-large;"><span style="color: rgb(153, 51, 0);"><span><strong>Benefits </strong><span><strong>of&nbsp;Whole Grains</strong></span></span></span></span></div> <p><span style="font-size: medium;"><span style="color: rgb(255, 153, 0);"><span style="font-size: medium;"><span style="color: rgb(255, 153, 0);"><img width="207" height="266" align="right" src="/SuperKids/images/SATStethoscope.jpg" alt="" /></span></span></span><strong><span style="color: rgb(153, 51, 0);"><span>The most documented benefits </span></span></strong><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">of whole grain consumption are:</span></span></span></p> <ul>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Better weight management</span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Type 2 diabetes risk reduced 21-30% </span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Stroke risk reduced 30-36%</span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Heart disease risk reduced 25-28% </span></span></li> </ul> <p><strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;">Other benefits</span></span></strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"> </span></span><span style="color: rgb(0, 0, 0);"><span style="font-size: medium;"><span><span style="font-size: x-small;">indicated by recent studies include:</span></span></span></span></p> <ul>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Reduced risk of asthma</span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Less gum disease and tooth loss</span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Healthier carotid arteries </span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Reduction&nbsp;of inflammatory disease risk </span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Lower risk of colorectal cancer</span></span></li>  <li><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">Healthier blood pressure levels</span></span>&nbsp;</li> </ul> <p><span style="font-size: xx-small;"><strong><span style="color: rgb(153, 51, 0);">Select Whole Grains &amp; Human Health for recent health studies.&nbsp;</span></strong><span style="color: rgb(153, 51, 0);"> </span></span><strong><span style="font-size: xx-small;"><span style="color: rgb(153, 51, 0);">(</span></span><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><span style="font-size: xx-small;">Source: The Whole Grains Council)</span></span></span></strong></p>
			""").save()



			def wholeGrainStudiesText = new PageText(name:"whole_grain_studies", content:"""
			<h1>Whole Grains & Human Health</h1>

			<p>As a nutrition professional, you're well aware of the food pyramid and the role that whole grains play in health and wellness. This section provides access to some of the many recent health studies for your reference.</p>
			<h2>A Detailed Study.</h2>
			<p>Dr. Joanne Slavin of the University of Minnesota has reviewed and compiled scores of recent studies to show how whole grain intake protects against cancer, cardiovascular disease, diabetes and obesity. Click here to access it:  <a href="#">Download PDF (454K)</a>  <strong>(Nutrition Research Reviews, May 2004; Vol 17: 99-110.)</strong></p>
			<h2>Quick Highlights.</h2>
			<p>Select your choice from this menu for highlights of recent studies. <strong>(Courtesy: The Whole Grains Council.)</strong> </p>

			<ul>
			  <li><a href="#" onclick="openPopUp(1)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Less Acne</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(2)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Chronic Disease Risk</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(3)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Lower Body Mass Index(BMI)</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(4)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Pancreatic Cancer&nbsp;</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(5)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Healthier Hearts</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(6)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Hypertension Risk</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(7)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Diabetes Risks</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(8)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Healthier Carotid Arteries</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(9)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Colorectal Cancer</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(10)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Breast Cancer</span></strong></a></li>
			  <li><a href="#" onclick="openPopUp(11)" class="popup"><strong><span style="color: rgb(255, 102, 0);">Reduced Risk of Childhood Asthma</span></strong></a><a onclick="popup('PopUp12');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><strong><span style="color: rgb(255, 102, 0);"><br />
			  </span></strong></a></li>
			</ul>



			<div class="PopUpClass" id="PopUp1">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span>
			  </div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span><span style="font-size: medium;"><strong>Less Acne</strong><br />
			  </span></span></span>Australian researchers led by Neil Mann recruited 50 young males (age 15-25) with mild to moderate acne for a twelve-week study of the relationship between diet and acne. Half the group ate a typical Western diet, while the other half ate lean meat, poultry, fish, fruits, vegetables and substituted whole grain bread, cereals and rice for refined foods. After twelve weeks, the acne of the group eating more protein and whole grains &quot;improved dramatically by more than fifty percent.&quot;&nbsp; <em>Journal of Dermatological Science, Apr 2008;50(1):41-52. Epub Jan 4, 2008. <br />
			  </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(1);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp2">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span><span style="font-size: medium;"><strong>Reduced Chronic Disease Risk</strong><br />
			  </span></span></span>A team of scientists in Boston and Baltimore led by PK Newby studied data from the Baltimore Longitudinal Study of Aging, and found that seniors consuming the most whole grain had lower body mass index (BMI) and weight, and smaller waist circumference. More whole grain consumption was also associated with lower total cholesterol, lower LDL cholesterol and improved glucose response. <em>Am. Journal of Clinical Nutrition, Dec 2007; vol 86(6): 1745-1753 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(2);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp3">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Lower Body Mass Index (BMI)</strong><br />
			  </span></span>UK researchers Janice Harland and Lynne Garton pooled data from fifteen studies on whole grain intake and BMI or adiposity, and found that in 119,829 male and female subjects age 13 or older, a higher intake of whole grains (about three servings per day) was associated with lower BMI and less central adiposity (abdominal fat). <em>Public Health Nutrition, Nov 16, 2007; 1-10.&nbsp; </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(3);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp4">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Pancreatic Cancer</strong><br />
			  </span></span>Pancreatic cancer is the most fatal cancer in the U.S., but eating two servings or more of whole grains daily may cut the risk of this swift and deadly killer by up to 40%. That was the finding of researchers at UC San Francisco led by June Chan, who compared diets of 532 pancreatic cancer patients with 1,701 people not suffering from the disease. <em>The American Journal of Epidemiology, November 2007; 166(10):1174-1185 </em>
			   <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(4);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp5">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Healthier Hearts</strong><br />
			  </span></span>After following 21,376 male physicians for almost 20 years, Luc Djouss&eacute; and J. Michael Gaziano at Harvard found that those eating two to six servings of whole grain cereal a week reduced their risk of heart failure 22%, while those eating whole grains daily reduced risk by 28%. For this study, cereals with at least 25% whole grain or bran by weight were classified as whole grain. <em>Archives of Internal Medicine, October 2007; 167: 2080-2085 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(5);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp6">
			  <div class="headline2"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></div>
			  <div style="font-size: 10px;"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Hypertension Risk</strong><br />
			  </span></span>Researchers at Harvard studied nearly 30,000 enrolled in the Women's Health Study. Lu Wang's team found that, over ten years, those who ate the most whole grains had an 11% lower chance of developing high blood pressure. <em>Am. Journal of Clinical Nutrition, Aug 2007; vol 86(2):472-9 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(6);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp7">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Diabetes Risk</strong></span><br />
			  </span>Also at the Harvard School of Public Health, researchers led by JS de Munter pooled data from six cohort studies including 286,125 participants, and found that a two-servings a day increment in whole grain consumption was associated with a 21% decrease in risk of type 2 diabetes. <em>PLoS Medicine, August 2007; 28;4(8):e261 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(7);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp8">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Healthier Carotid Arteries</strong><br />
			  </span></span>A study by Philip Mellen at Wake Forest University and colleagues measured atherosclerosis of the common carotid artery, and its progression over five years. Mellen's team found that, among the 1178 men and women in the study, those who ate more whole grains had less unhealthy artherosclerotic thickening of the common carotid artery.&nbsp; <em>Am. Journal of Clinical Nutrition, June 2007; vol 85(6):1495-1502 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(8);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp9">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Colorectal Cancer</strong></span><br />
			  </span>A team of researchers led by Arthur Schatzkin studied data for almost half a million middle-aged men and women enrolled in the NIH-AARP Diet and Healthy Study, to learn whether fiber intake and/or whole grains might reduce the risk of colorectal cancer. In this analysis, total dietary fiber intake was not associated with a reduced risk of colorectal cancer, but both grain fiber and whole grains were shown likely to reduce the risk of colorectal cancer. <em>Am. Journal of Clinical Nutrition, May 2007; vol 85(5):1353-1360 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(9);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp10">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Breast Cancer</strong><br />
			  </span></span>A UK study suggests that women who eat large amounts of fiber could cut breast cancer risk in half. The effect was greatest on pre-menopausal women, which Janet Cade and her team at Leeds University say may be because fiber affects the way the body processes and regulates the female hormone estrogen. <em>International Journal of Epidemiology, April 2007; 36(2):431-8 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(10);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp11">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Childhood Asthma</strong><br />
			  </span></span>A team from the Dutch National Institute of Public Health and the Environment found that children who ate whole grains were 54% less likely to develop asthma and 45% less likely to develop wheezing than children who did not eat whole grains. <em>Thorax, December 2006; 61(12):1048-53 </em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(11);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>
			</div>

			<div class="PopUpClass" id="PopUp12">
			  <div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div>
			  <div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div>
			  <br />
			  <br />
			  <span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Help For Overweight Children</strong><br />
			  </span></span>Overweight children, age 9-15, spent two weeks on an all-you-can-eat diet of whole grains, fruits, vegetables and lean protein, while exercising 2.5 hours each day. UCLA researchers led by Dr. James Barnard reported that in just two weeks the children's cholesterol levels dropped an average of 21%, while insulin levels fell 30%. Leptin, a hormone thought to be connected to appetite, decreased on average 57%.&nbsp; <em>(Study presented at American Heart Assn. conference, Mar. 2006.)</em>
			  <div style="text-align: right;"><a style="font-size: 12px;" onclick="closePopUp(12);" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div>    </div>


										  """
				).save()

			def ultragrainText = new PageText(name:"ultragrain", content:"""
				<h1>Ultragrain&reg;: Whole Wheat Flour.</h1> <div style="float:left; width:400px;"> <p><img width="195" height="97" align="left" alt="" src="/SuperKids/images/SATURDAYPBJSANDWICHHORIZ.jpg" /> Demand for whole grains in schools is skyrocketing, but many students still crave the classic taste, texture and appearance of white flour products. With Ultragrain&reg;, ConAgra Mills gives students the best of both worlds. Using patented milling technology with specially selected white wheat, Ultragrain&reg; whole wheat flour and products made with Ultragrain&reg; deliver great taste and the all-natural whole grain nutrition of 100% whole wheat. With Ultragrain&reg;, students won&rsquo;t notice changes in color, taste or texture that they often complain about when eating foods made with traditional whole wheat flour, a fact that&rsquo;s been proven in several studies.</p> <h2>Did you know?</h2> <img width="84" height="108" align="left" style="float: right;" src="/SuperKids/images/UltragrainDidYouKnow.jpg" alt="" /><br /> <p>For the first time, students can enjoy everything from breads to pasta, pizza dough, cookies, crackers and even pastries-all with the benefits of whole grain nutrition.</p> <p>Ultragrain has been the driving force behind many successful consumer products, and is now available at your local grocer under the Eagle Mills&reg; brand. Visit <a href="http://www.ultragrain.com/">Ultragrain.com</a> to learn more.</p> </div> <div style="float: right; width: 221px;"> <p style="text-align: right;">&nbsp;<img width="180" height="176" style="width: 196px; height: 190px;" alt="" src="/SuperKids/images/UltraGrainlogo.jpg" /> </div>
							  """
				).save()

			def sustagrainText = new PageText(name:"sustagrain", content:"""
			<h1>Sustagrain&reg;: The Ultra-High Fiber Whole Grain</h1>
			<div style="float: left; width: 300px;">
			<p>Another first from ConAgra Mills, all-natural Sustagrain is the highest-fiber whole grain available, with three times the total dietary fiber (TDF) of oats and up to eight times the TDF of other whole grains. Made from a proprietary variety of barley, Sustagrain has a neutral flavor that can boost the nutrition in any recipe. With Sustagrain, a little goes a long way toward making a nutritional difference. Whether you&rsquo;re making recipes from scratch, using it as a topping, or trying products made with it, Sustagrain adds whole grain nutrition and fiber to almost any application including breads, hot cereals, snack bars, side dishes and meat recipes like meatloaf or meatballs. Sustagrain is available as an ultrafine flour, oat-like flakes, and toasted, sweetened flakes.</p>
			</div>
			<p>&nbsp;</p>
			<p style="text-align:left;"><img width="300" height="114" align="right" src="/SuperKids/images/SustagrainLogo.gif" /></p>

			<div style="clear: both;">
				<p><a href="/SuperKids/pdf/J-Food-Sci-2009-Children's-acceptance-whole-grain-and-soluble-fiber-enriched-foods.pdf"><img width="32" height="32" border="0" align="absMiddle" style="width: 26px; height: 26px;" alt="Download PDF" src="/SuperKids/images/pdficon.gif" /></a>&nbsp;&nbsp;<a href="/SuperKids/pdf/J-Food-Sci-2009-Children's-acceptance-whole-grain-and-soluble-fiber-enriched-foods.pdf">View the Study</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:popUp('http://www.conagramills.com/downloads/videos.jsp?flv_str=Sustagrain_300k',326,265)"><img width="29" height="29" border="0" align="absMiddle" src="http://www.conagramills.com/images/thumb_video_sustagrain.jpg" /></a>&nbsp;&nbsp;<a href="javascript:popUp('http://www.conagramills.com/downloads/videos.jsp?flv_str=Sustagrain_300k',326,265)">VIDEO - Sustagrain</a></p>
			</div>
			<div style="clear: both;"><br />
				<br />
				<p><strong>See how Sustagrain stacks up by comparing it to other whole grains shown in the following charts; or click here:</strong> <img width="32" height="32" border="0" align="absmiddle" alt="Download PDF" src="/SuperKids/images/pdficon.gif" /> <a href="/SuperKids/pdf/Sustagrain.pdf"><strong>Download the Sustagrain PDF</strong></a></p>
				<p><img width="450" height="293" src="/SuperKids/images/fiber_comparison.jpg" /> <img width="450" height="227" src="/SuperKids/images/gi_comparison.jpg" /></p>
			</div>
							  """
				).save()
	}
}

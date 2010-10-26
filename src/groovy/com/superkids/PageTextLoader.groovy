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
				<h1>GET REWARDED JUST BY TELLING US WHAT YOU THINK!</h1> <img src="/SuperKids/images/Starburst.jpg" id="awardstar" /> <div style="width:430px; float:right; margin-top:27px; margin-right:16px;"><p>Your feedback is invaluable; it lets us know how to improve the SuperKids program and helps manufacturers better understand your needs.</p> <p>After you&rsquo;ve received and tried your free samples, please give us your feedback by completing the short five-question survey. Do so between November 15, 2010 and March 9, 2011, and you&rsquo;ll earn the chance to win one of these special prizes:</p><br/>  </div> <div style="clear:both">  <ol style="list-style-type:decimal; font-size:10px;">  <li><span style="color:#800000">FIVE (5) First Place Prizes</span>--&#36;200 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>  <li><span style="color:#800000">SEVEN (7) Second Place Prizes</span>--&#36;100 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>  </ol>  <p>When you receive your samples, a printed Assessment Form will be included in the box. Complete it, then fax or mail it back and you&rsquo;ll be automatically entered in our drawing. If you fill out the assessment form online you&rsquo;ll double your chances to win one of our sweepstakes prizes!</p>  <p><em>To get started, just <a href="/SuperKids/assessment/assessment_process">click here</a>, or on &ldquo;Begin Online Assessment&rdquo; in the menu. If you don&rsquo;t finish, your progress will be saved so that you can come back later.</em></p></div>
				"""
				).save()

			def promoteText = new PageText(name:"promote", content:"""
				<h1>Promote Whole Grain Nutrition</h1> <br/><div style="width:350px;"><p>Promoting whole grain nutrition in our nation's schools is important. Whole grains improve health, ward off diseases, control weight, help school districts meet gold standards and more. This section includes resources you can use to spread the word about whole grain health, the SuperKids program, and your school's efforts to bolster nutrition.</p> <h2>Send An eCard</h2> <p>Send an eCard to other school districts or foodservice distributors/brokers to tell them about the SuperKids Whole Grain Product Sampling Program.</p> <h2>Promotional Tools & Resources</h2><p>Includes letters, articles and a poster. Promote the importance of whole grain nutrition; request parental approval for child participation in taste tests; download three customizable articles for your school's newsletter.</p> <h2>Additional Promotional Ideas</h2><p> Includes "Creative Nutrition Messaging In Your Lunchroom" from <em>The Learning Zone</em>, and more rewards available from The Whole Grains Council.</p> <h2>Educational Partner Materials</h2> <p>In addition, to help you promote healthier eating habits with students and their parents, you&rsquo;ll have access to invaluable educational tools from four partners in our program: The Whole Grains Council, Alliance for a Healthier Generation, Learning ZoneXpress and The OrganWise Guys. <em>(<strong><a href="#">Click here</a></strong> for details on specific tools available as well as contact and ordering information.)</em> </p> <p><strong>Select your choice from the Promote Menu Options on the left.</strong></p></div> <img id="kid4" src="/SuperKids/images/NEWKIDwithcorndog.jpg"/>
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
					<div style="width:500px;">
					<p>eCards are available for foodservice distributors, brokers, or school foodservice directors. Click on the eCard of your choice. They're the easy way to spread the word about whole grain health and SuperKids.</p>
					<p><a href="/SuperKids/home/ecards_send" style="#FF6600; font-weight:bolder; text-decoration:none">Foodservice Distributor or Broker eCard</a></p>
					<p><a href="/SuperKids/home/ecards_send" style="#FF6600; font-weight:bolder; text-decoration:none">Foodservice Director eCard</a></p>
					<p><strong>Click on the options above.</strong></p>
				</div>
				<img src="/SuperKids/images/manatcomputer.jpg" id="man" />
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
				""").save()

			def assessmentToolsText = new PageText(name:"assessment_tools", content:"""
				<h1>Assessment Tools & Resources</h1><br/><br/> <img src="/SuperKids/images/girleating.jpg" id="girleating" /> <div>  <p style="font-size:13px;">You can download the following by clicking on your choice. These tools and resources can be used when conducting in-school taste tests of your SuperKids whole grain product samples:</p>  <br />  <p style="font-size:13px"><a href="/SuperKids/home/minnesota_form">University of Minnesota Module</a> - Includes whole grain definitions, nutritional and labeling information.</p>  <br />  <p style="font-size:13px"><a href="/SuperKids/home/assessment_form">Printable Assessment Form</a> - Download and print the assessment form. When complete, just fax or mail to the fax number or address provided.</p>  <br />  <p style="font-size:13px"><a href="/SuperKids/home/student_form">Student Feedback Form</a> - This form was developed for use with younger students (K-3).</p>  <br />  <p style="font-size:13px"><a href="/SuperKids/home/student_certificate">Student Certificate</a> - Download and print it, then give it to student taste-testers to recognize them for participating as a SuperKid.</p> </div>
				""").save()

			def whatIsText = new PageText(name:"what_is", content:"""
				<h1>What Is SuperKids?</h1><br/>  <p style="font-size:12px;">SuperKids is a unique school foodservice program that offers free samples of whole grain and high-fiber snack, breakfast and lunch menu options that students will love. This year&rsquo;s program includes great-tasting products designed specifically for K-12 students from these manufacturers:</p> <img style="margin-left:15px; margin-bottom:10px;" src="/SuperKids/images/sponsors2010.png" />  <h2>SuperKids is the only product sampling program of its kind that:</h2>  <ul>  <li>Lets you choose the whole grain and high-fiber products you&rsquo;d like to try</li>  <li>Notifies you via e-mail when your samples are going to ship</li>  <li>Delivers the samples directly to you so that you can evaluate them on your own ahead of the bid season</li>  <li>Solicits your input for product improvements and new products</li>  <li>Includes resources to promote whole grain nutrition</li>  <li>Offers rewards for timely feedback</li>  <li>Provides tools to help you promote your district&rsquo;s whole grain success</li>  <li>Is completely free to you courtesy of ConAgra Mills and the manufacturers who participate in the program</li>  <li>Provides access to Partner Educational Materials to help your school promote healthier eating habits</li>  </ul>
			  """).save()

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

			def councilTips = new PageText(name:"council_tips", content:"""
				<h1>Whole Grains Council Tips</h1> <p><a target="_blank" href="http://www.wholegrainscouncil.org"><img style="width: 82px; height: 46px; float:left; position:relative; left:10px; top:22px; margin-right:20px; margin-bottom:25px;" src="/SuperKids/images/wgc.jpg" /></a></p> <img style="height:600px; width:146px; float:right; " src="/SuperKids/images/SATURDAYCUPCAKEVERTICAL.jpg" /> <p>The Whole Grains Council is a nonprofit consumer advocacy group working to increase consumption of whole grains for better health. The following are&nbsp;some of their ideas for increasing the whole grain content in school food programs.&nbsp; Ultragrain and Sustagrain can be substituted in many of the tips offered below.&nbsp;In fact, Sustagrain works particularly well in any recipe that calls for oats and the Healthy Choice varieties of Ultragrain flour are already blended with traditional flour to make the transition to whole grain even easier.<span style="font-weight:bolder; color:#993300">(Note: To Go To The Whole Grains Council website, click their logo on the left)</span></p> <h2 style="color:#993300">Ultragrain and Sustagrain make easy substitutions </h2> <ul>  <li><span style="font-size: x-small">Substitute half the white flour with whole wheat flour in your regular recipes for cookies, muffins, quick breads and pancakes.</span></li>  <li><span style="font-size: x-small">Add up to 20% of another whole grain flour such as sorghum. </span></li>  <li><span style="font-size: x-small">Replace one third of the flour in a recipe with quick oats or old-fashioned oats. </span></li>  <li><span style="font-size: x-small">Add half a cup of cooked bulgur, wild rice, or barley to bread stuffing. </span></li>  <li><span style="font-size: x-small">Add half a cup of cooked wheat or rye berries, wild rice, brown rice, sorghum or barley to your favorite canned or homemade soup. </span></li>  <li><span style="font-size: x-small">Use whole corn meal for corn cakes, corn breads and corn muffins. </span></li>  <li><span style="font-size: x-small">Add three-quarters of a cup of uncooked oats for each pound of ground beef or turkey when you make meatballs, burgers or meatloaf. </span></li>  <li><span style="font-size: x-small">Stir a handful of oats in your yogurt, for quick crunch with no cooking necessary.</span></li> </ul> <h2 style="color:#993300">Try new foods</h2> <ul>  <li><span style="font-size: x-small">Make risottos, pilafs and other rice-like dishes with whole grains such as barley, brown rice, bulgur, millet, quinoa or sorghum.</span></li>  <li><span style="font-size: x-small">Enjoy whole grain salads like tabbouleh.</span></li>  <li><span style="font-size: x-small">Buy whole grain pasta, or one of the blends that's part whole grain, part white.</span></li>  <li><span style="font-size: x-small">Try whole grain breads. Kids especially like whole grain pita bread.</span></li>  <li><span style="font-size: x-small">Look for cereals made with grains like kamut, kasha (buckwheat) or spelt.</span></li>  <li><span style="font-size: x-small">Experiment with New Recipes.</span></li> </ul> <img style="height:91px; width:146px; float:right; position:relative; bottom:30px; right:32px; margin-top:30px" src="/SuperKids/images/NEWPASTAshot.jpg" /><h2 style="color:#993300;">Explore whole grain recipes</h2><br/> <a target="_blank" href="http://www.wholegrainscouncil.org/recipes"><span style="font-size:10px; color: #ff6600">Click here </span></a><span style="font-size: 10px; color: #000000">for excellent recipes dedicated to whole grain cooking.</span> <p>&nbsp;</p><br/>
			""").save()


			def wholeGrainBenefitsText = new PageText(name:"whole_grain_benefits", content:"""
				<h1>Benefits of&nbsp;Whole Grains</h1> <br/> <img style="width:207px; height:266px; float:right" src="/SuperKids/images/SATStethoscope.jpg" alt="" /> <p><strong><span style="color: rgb(153, 51, 0); font-size:16px"><span>The most documented benefits </span></span></strong> of whole grain consumption are:</span></span></span></p>  <ul> <li>Better weight management</li> <li>Type 2 diabetes risk reduced 21-30% </li> <li>Stroke risk reduced 30-36%</li> <li>Heart disease risk reduced 25-28% </li> </ul>  <p><strong><span style="color: rgb(153, 51, 0); font-size:16px;">Other benefits</span></strong> indicated by recent studies include:</p> <ul> <li>Reduced risk of asthma</li> <li>Less gum disease and tooth loss</li> <li>Healthier carotid arteries </span></span></li> <li>Reduction&nbsp;of inflammatory disease risk</li> <li>Lower risk of colorectal cancer</li> <li>Healthier blood pressure levels</li> </ul>  <p style="font-size: 10px;color: rgb(153, 51, 0);">Select Whole Grains &amp; Human Health for recent health studies.&nbsp;Source: The Whole Grains Council)</p>
				""").save()

			def wholeGrainListText = new PageText(name:"whole_grain_list", content:"""
				<h1>List of Whole Grains</h1><br/> <img style="height:260px; width:75px; float:right" src="/SuperKids/images/VirginiaWildRye.jpg" /><img style="height:260px; width:37px; float:right; padding-right:5px;" src="/SuperKids/images/SATWHEATVERT.jpg" /><img style="height:260px; width:193px; float:right; padding-right:5px" src="/SuperKids/images/verynicewheatstalks.jpg" /> <p style="font-size: 12px">The following is the list of seeds that are considered whole grains:&nbsp;&nbsp;</p> <ul>  <li>  <div><span style="color: #000000">Amaranth </span></div>  </li>  <li>  <div><span style="color: #000000">Barley </span></div>  </li>  <li>  <div><span style="color: #000000">Buckwheat </span></div>  </li>  <li>  <div><span style="color: #000000">Corn, including whole cornmeal and popcorn </span></div>  </li>  <li>  <div><span style="color: #000000">Millet </span></div>  </li>  <li>  <div><span style="color: #000000">Oats, including oatmeal </span></div>  </li>  <li>  <div><span style="color: #000000">Quinoa </span></div>  </li>  <li>  <div><span style="color: #000000">Rice (brown rice and colored rice) </span></div>  </li>  <li>  <div><span style="color: #000000">Rye </span></div>  </li>  <li>  <div><span style="color: #000000">Sorghum (also called milo) </span></div>  </li>  <li>  <div><span style="color: #000000">Teff </span></div>  </li>  <li>  <div><span style="color: #000000">Triticale </span></div>  </li>  <li>  <div><span style="color: #000000">Wheat </span></div>  </li> </ul> <p style="font-size: 12px"><span style="color: #000000">Wheat varieties include&nbsp;spelt, emmer, farro, einkorn, Kamut<sup>&reg;</sup>, durum and&nbsp;bulgur.&nbsp;</span></p> <p><strong><span style="color: #993300"><span style="font-size: 10px">Note: This list is not comprehensive and includes only those grains most familiar to consumers. Cereal grasses from the Poaceae (or Gramineous) family, such as canary seed, Job's tears, Montina, fonio,&nbsp;and others&nbsp;are also whole grains. Oilseeds and legumes (such as flax, sunflower seeds, soy, chickpeas, etc.) are not considered whole grains. <em>(Credit: Whole Grains Council)</em></span></span></strong></p>
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
			  """).save()


			def whatAreWholeGrainsText = new PageText(name:'what_are_whole_grains', content:"""
			<h1>What Are Whole Grains?</h1><br/> <p><span style="color: #000000"><span style="font-size: x-small"><span style="font-size: x-small"><span style="color: #993300"><strong><img style="height:130px; width:175px; float:left" src="/SuperKids/images/BRAN-GERM-ENDO(1).jpg" /></strong></span></span>All grains start life as whole grains.&nbsp;Whole grains&nbsp;are the entire seed of a plant and consist&nbsp;of three parts:</span></span></p> <p><span style="font-size: x-small"><span style="color: #993300"><strong>Germ: </strong></span><span style="color: #000000">The germ is the embryo which, when fertilized by pollen, will sprout into a new plant.</span></span></p> <p><span style="font-size: x-small"><span style="color: #993300"><strong>Bran:</strong></span><strong><span style="color: #ff9900"> </span></strong><span style="color: #000000">The bran is the multi-layered outer skin of the kernel.</span></span></p> <p><span style="font-size: x-small"><span style="color: #993300"><strong>Endosperm:</strong> </span><span style="color: #000000">The endosperm is the germ's food supply.&nbsp;This is the wheat component used for traditional white flour.</span></span></p> <p><span style="font-size: x-small"><span style="color: #000000">Whole grains, or the&nbsp;foods made from them, contain all the essential parts and naturally occurring nutrients of the entire grain seed. If the grain has been processed (cracked, crushed, rolled, and/or milled into flour),&nbsp;the food product should deliver approximately the same rich balance of nutrients that are found in the original seed.&nbsp;</span></span></p> <p><span style="font-size: x-small"><span style="color: #000000">Traditional flour-milling techniques, designed to produce the white color and smooth texture consumers now expect, remove the bran and germ &hellip; along with 17 nutrients. Even when the resulting flour is enriched, refined white flour does not meet the nutrition test.&nbsp;</span><strong>&nbsp;</strong></span><strong><span style="font-size: xx-small"><span style="color: #993300">(See Whole Grains &amp; Human Health for highlights)</span></span></strong></p> <p><strong><span style="color: #993300"><span style="font-size: medium">Whole grain foods&nbsp;provide&nbsp;fiber, vitamins, minerals and proteins,</span> </span></strong><span style="color: #000000"><span style="font-size: x-small">often with more nutrients and vitamins than even fruits and </span></span><span style="color: #000000"><span><span style="font-size: x-small">vegetables.&nbsp; In fact, the medical&nbsp;evidence is overwhelming. The antioxidants and phytonutrients in whole grains help reduce the risk of heart disease, diabetes, obesity, stroke, and cancer. Whole grain products are also excellent sources of B vitamins, vitamin E, magnesium, iron and dietary fiber.</span></span></span></p> <p><span style="color: #000000"><img style="height:44px; width:64px; float:left" src="/SuperKids/images/USDAlogo.jpg" /><span style="font-size: x-small"><span>The USDA, American Heart Association, and Department of Health and Human Services generally agree that children ages four through 18 should eat between three and six&nbsp;servings of whole grains daily. A typical &quot;serving&quot; would be a slice of bread, a bowl of cereal, or a muffin.&nbsp;<img style="height:171px; width:229px;float:right" src="/SuperKids/images/mypyramid.jpg" />Yet, the average school-age child in America consumes less than one serving of whole grain foods each day. The reason? Taste.</span></span></span></p> <p><span style="color: #000000"><span style="font-size: x-small">Despite the fact that the grain-refining process removes the essential nutrients, people often prefer the taste and texture of foods made with refined white flour.&nbsp;Whole grain products just haven't made the good taste grade&mdash;until Ultragrain.&nbsp;</span></span></p> <p><span style="color: #000000"><span style="font-size: x-small"><img height="36" alt="" hspace="10" width="62" align="left" src="/SuperKids/images/wgc.jpg" />Thanks to&nbsp;the&nbsp;<em>Whole Grains Council </em>for providing&nbsp;the factual information about whole grains that is presented here.&nbsp;For additional articles about whole grain&nbsp;nutrition,&nbsp;go to&nbsp;</span></span><a target="_blank" href="http://www.wholegrainscouncil.org."><span style="font-size: x-small"><strong><span style="color: #ff6600">www.wholegrainscouncil.org.</span></strong></span></a></p> 
			""").save()

			def ultragrainText = new PageText(name:"ultragrain", content:"""
				<h1>Ultragrain&reg;: Whole Wheat Flour.</h1> <div style="float:left; width:400px;"> <p><img width="195" height="97" align="left" alt="" src="/SuperKids/images/SATURDAYPBJSANDWICHHORIZ.jpg" /> Demand for whole grains in schools is skyrocketing, but many students still crave the classic taste, texture and appearance of white flour products. With Ultragrain&reg;, ConAgra Mills gives students the best of both worlds. Using patented milling technology with specially selected white wheat, Ultragrain&reg; whole wheat flour and products made with Ultragrain&reg; deliver great taste and the all-natural whole grain nutrition of 100% whole wheat. With Ultragrain&reg;, students won&rsquo;t notice changes in color, taste or texture that they often complain about when eating foods made with traditional whole wheat flour, a fact that&rsquo;s been proven in several studies.</p> <h2>Did you know?</h2> <img width="84" height="108" align="left" style="float: right;" src="/SuperKids/images/UltragrainDidYouKnow.jpg" alt="" /><br /> <p>For the first time, students can enjoy everything from breads to pasta, pizza dough, cookies, crackers and even pastries-all with the benefits of whole grain nutrition.</p> <p>Ultragrain has been the driving force behind many successful consumer products, and is now available at your local grocer under the Eagle Mills&reg; brand. Visit <a href="http://www.ultragrain.com/">Ultragrain.com</a> to learn more.</p> </div> <div style="float: right; width: 221px;"> <p style="text-align: right;">&nbsp;<img width="180" height="176" style="width: 196px; height: 190px;" alt="" src="/SuperKids/images/UltraGrainlogo.jpg" /> </div>
							  """
				).save()

			def studentCertificateText = new PageText(name:"student_certificate", content:"""
				<<h1>Student Certificate</h1><br/> <p>Give this certificate to <span>students who participate in student trials.</p> <p>&nbsp;&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p> <a href="/SuperKids/pdf/Certificate.pdf"><img style="height:162px; width:250px; border:0" src="/SuperKids/images/studentcertificate.jpg" /></a> <p style="font-weight:bolder; position:relative; bottom:40px; left:255px; width:380px; color:#993300;"><img style="width32px; height:32px; line-height:32px; border:0;" src="/SuperKids/images/pdficon.gif" />&nbsp;Click on the certificate to download and print it.</p> <p> <p>&nbsp;</p> </p> <p>&nbsp;</p>
				""").save()

			def studentFormText = new PageText(name:"student_form", content:"""
				<div style="width:620px;"> <h1>Student Feedback Form</h1> <p><a href="/SuperKids/pdf/kidsasessmentform.pdf"><img style="border:0; float:left; height:284px; width:211px" src="/SuperKids/images/kidsformthumb.jpg" /></a></p> <p>&nbsp;</p> <p>Give&nbsp;this form&nbsp;to younger students (grades K-3) who try out the&nbsp;whole grain product samples you receive from&nbsp;SuperKids.</p> <p>&nbsp;</p> <p style="font-weight:bolder; color:#993300;"><img style="width32px; height:32px; line-height:32px; border:0;" src="/SuperKids/images/pdficon.gif" />&nbsp;Click on the image to download and print the Student Feedback Form.</p> </div> 
			""").save()

			def assessmentFormText = new PageText(name:"assessment_form", content:"""
				<h1>Assessment Form</h1><br/> <div style="width: 600px;"> <p>Provide feedback for each product you received to be eligible for the Feedback Appreciation Drawing. Your feedback form must be received between November 9, 2009, and March 5, 2010.</p> <p>After you complete your feedback form, fax or mail both sides to the fax number or address shown below. You can also give us your feedback online by logging in at www.superkidssampling.com.</p> <img alt="" src="/SuperKids/images/SDA_Assessment_2009_Page_1.gif" style="margin-left:52px" /><br /> <a href="/SuperKids/pdf/SDA_Assessment_2009.pdf"><img class="downloadPDF" alt="Download PDF" src="/SuperKids/images/pdficon.gif" /> Download Printable Assessment Form </a> <p>&nbsp;</p> </div> 
			""").save()
			
			def minnesotaForm = new PageText(name:"minnesota_form", content:"""
				<h1>University of Minnesota Module</h1><br/> <p><span style="color: #000000"><span style="font-size: x-small">Provides educational components for school foodservice directors, staff, and dietitians.</span></span></p> <p>Includes whole&nbsp;grain definitions, nutritional and labeling information.</p> <p>Click&nbsp;the link below to download these tools.</p> <p><a target="_blank" style="font-size:13px; color:#FF6600" href="http://www.extension.umn.edu/distribution/nutrition/DJ8498.html">University of Minnesota Module </a></p>
				""").save()

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

			def anonymousText = new PageText(name:"anonymous", content:"""
            <h1>Welcome to Superkids!</h1>
<span style="font-size: x-large;"><span style="color: rgb(153, 51, 0);"><strong><span class="bu"><img width="160" hspace="8" height="442" align="right" src="/SuperKids/images/NEWGIRLeatingpizzaVERTICAL.jpg" alt=""></span></strong></span></span>
<p>SuperKids targets the largest public school districts in America </span></span></span></strong></span><span style="font-size: x-small;"><span style="color: rgb(0, 0, 0);">by offering foodservice directors the chance to taste-test specific new products from a variety of trusted food companies and bakeries. All of these products are made with Ultragrain<sup>®</sup> and/or Sustagrain<sup>®</sup>, the program is absolutely free, and feedback about the products sampled is reported to our manufacturers and the appropriate foodservice distributors/brokers.</span></span></p>
<p><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>We can prove high acceptance of whole grain products in our nation's schools.</strong></span></span>&nbsp;&nbsp;<span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;">SuperKids is in its forth year. Last year, over 1,284 of the largest public school districts in America requested and received 6,079 product samples from a pool of 16 products made with Ultragrain.&nbsp;In independent studies, elementary school students consumed products made with Ultragrain at the same levels as&nbsp;products made with refined flour. The difference&nbsp;is Ultragrain's taste, look and texture.&nbsp;It's revolutionary, innovative, and a major technological breakthrough.</span></span></p>
<p><span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;"><strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;">Ultragrain</span></span></strong></span><span><strong><span style="color: rgb(153, 51, 0);"><span><sup>®</sup></span></span></strong></span><span style="font-size: x-small;"> makes it possible for students to receive high amounts of fiber, along with the full nutritive value of whole grains in foods they are familiar with and love. With Ultragrain, students don't notice changes in color, taste or texture that they often complain about when eating foods that use traditional whole grain flour.</span></span></p>
<p><span style="color: rgb(0, 0, 0);"><span style="font-size: x-small;"><span style="font-size: medium;"><span style="color: rgb(153, 51, 0);"><strong>Sustragrain<span style="font-size: x-small;"><span><span><sup>®</sup></span></span></span> </strong></span></span>is an ultra high-fiber whole grain&nbsp;that is&nbsp;known for its great taste and healthful properties.&nbsp;SuperKids showcases products made with&nbsp;Sustagrain—a way to add&nbsp;fiber into a range of recipes without kids even knowing it. In flour form, Sustagrain can be used in baked goods, meat preparations, sauces and dips.&nbsp;In flake form, it works great in hot cereals, snacks, desserts&nbsp;and toppings.&nbsp;&nbsp;</span></span></p>
<p><span style="font-size: xx-small;"><span style="color: rgb(153, 51, 0);"><strong>For more information, select from the options shown on the left or bottom of&nbsp;your screen. </strong></span></span></p>
<p>&nbsp;</p>
							  """
				).save()

                             def dietsText = new PageText(name:"public_diets", content:"""
<h1>Adding Whole Grains In Children's Diets</h1>
<p>
  <img width="168" hspace="8" height="270" align="right" src="/SuperKids/images/NEWKIDwithcorndog.jpg" alt="" style="width: 143px; height: 238px;" />
  Parents want to know that their kids are eating great-tasting, nutritious foods at school. A growing number of America's school cafeterias feature a variety of foods made with Ultragrain. The SuperKids program from&nbsp;ConAgra Mills, the maker of Ultragrain and Sustagrain, gives school districts the opportunity to sample products made with these healthful ingredients.
</p>
<h2>Give students whole grain goodness.</h2>
<p>
  Whether you are a parent, or are employed by your school district in foodservices, giving students more whole grain foods is one of the healthiest things you can do. Ultragrain and Sustagrain can be found in many foods at your local grocery stores, in restaurants, and even in school cafeterias. Look for these <a href="/SuperKids/public-diets-students" title="Give Your Students Whole Grain Goodness"><strong>products</strong></a> on your grocery shelves.
</p>
<p>
  A variety of food manufacturers have offered their products to school districts. We recommend that your school&nbsp;consider these whole grain <a href="/SuperKids/public-other-products" title="Meet the Prior Super Heros of Superkids"><strong>products</strong></a> as well.
</p>
<p>
<img width="168" hspace="8" height="70" align="right" src="/SuperKids/images/SATURDAYPBJSANDWICHHORIZ.jpg" alt="" style="width: 144px; height: 53px;" />
<h2>Check out our whole grain recipes</h2>
<p>
  using Eagle Mills All-Purpose Flour made with Ultragrain. Cup-for-cup, you'll get more whole grain nutrition, with the same great taste. Click <a href="http://www.ultragrain.com/where_to_find_recipes.jsp" target="_blank"><strong>here</strong></a> for recipe options you can incorporate into family meals.
</p>
<p>
  <img width="293" vspace="20" hspace="20" height="94" align="right" src="/SuperKids/images/NEWLOGOspread.jpg" alt="" />
<h2>Make your interest known.</h2>
<p>If you are a parent and would like your child's school to add these products to its menu, contact the foodservice director in your school district. Products featured in the SuperKids Whole Grain Sampling program include these brands and trusted manufacturers:</span></span></p>
                                                         """
                                ).save()

                             def publicOtherProductsText = new PageText(name:"public_other_products", content:"""
<h1>Other Products With Ultragrain<sup>&reg</sup> and Sustagrain<sup>&reg;</sup></h1>
<p>
  These companies use Ultragrain in their products. Look for them on your grocer's shelves.
</p>
<table style="width: 593px; height: 800px; float:left">
    <tbody>
        <tr>
            <td align="center" colspan="2"><strong>National Distribution </strong></td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top"><a href="http://www.caravaningredients.com/" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Caravan Products Co.</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>800-256-5261</td>
            <td width="400" valign="top">VitoGrain Whole Wheat Bread Mix, 7 Grain Bread Mix, and Krunchy Wheat Bread Mix</td>
        </tr>
        <tr>
            <td width="200" valign="top"><a href="http://www.conagrafoodservice.com/contact_us/contact_us.jsp" target="_blank"><strong><span style="color: rgb(255, 102, 0);">ConAgra Foods, Consumer Foods School Foodservice</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>937-498-4511</td>
            <td width="400" valign="top">
            <p>Healthy Choice<sup>&reg;</sup> Cinnamon Bakes&trade; (Strawberry and Apple)<br />
            The Max<sup>&reg;</sup> Stuffed Crust Cheese Pizza<br />
            The Max<sup>&reg;</sup> Stuffed Crust Pepperoni Pizza<br />
            The Max<sup>&reg; </sup>Twisted Edge&trade; Pizza<br />
            MaxWraps&trade; Chili Cheese Wrap<br />
            The Max<sup>&reg; </sup>Whole Grain Pancakes with Cinnamon Glaze<br />
            The Max<sup>&reg;&nbsp; </sup>Whole Grain Chees-Filled Breadsticks</p>
            </td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top"><a href="http://www.conagrafoodingredients.com/contact/index.jsp" target="_blank"><strong><span style="color: rgb(255, 102, 0);">ConAgra Mills</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>402-595-6324</td>
            <td width="400" valign="top">Ultragrain<sup>&reg;</sup> 100% Whole Grain Flour - Hard and Soft<br />
            Healthy Choice<sup>&reg;</sup> All-Purpose Flour Blends Made with Ultragrain<sup>&reg;</sup><font size="2">&mdash;</font>T-1 and T-2</td>
        </tr>
        <tr>
            <td width="200" valign="top"><a href="http://www.dawnfoods.com/" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Dawn Food Products, Inc.</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>(517) 789-4400</td>
            <td width="400" valign="top">Whole Grain Brownies, Cookies, Cr&egrave;me Cake, Donuts &amp; Muffins</td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top"><a href="http://www.dominos.com/" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Domino's Pizza</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>(800) 810-6633</td>
            <td width="400" valign="top">Smart Slice&trade;</td>
        </tr>
        <tr>
            <td width="200" valign="top"><a href="http://www.doubleb.com/contact.php" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Double B Foods, Inc.</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>800-472-6661</td>
            <td width="400" valign="top">Whole Grain Wheat Sausage Roll</td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top"><a href="http://www.jjsnackfoodservice.com/" target="_blank"><strong><span style="color: rgb(255, 102, 0);">J&amp;J Snack Foods Corp</span></strong></a><strong><span style="color: rgb(255, 102, 0);"><br />
            </span></strong>888-JJSNACK</td>
            <td width="400" valign="top">
            <p>READI-BAKE<sup>&reg; </sup>Bene<em>FIT</em>&trade; Reduced Fat Cookies<br />
            READI-BAKE<sup>&reg;</sup> Bene<em>FIT</em>&trade; White Wheat Dinner Roll Dough<br />
            SUPERPRETZEL<sup>&reg; </sup>51% Whole Wheat Soft Pretzel<font size="2">&mdash;</font>1 oz. Rod <br />
            SUPERPRETZEL<sup>&reg;</sup> 51% Whole Wheat Soft Twisted Pretzel<font size="2">&mdash;</font>2.5 oz.<br />
            READI-BAKE<sup>&reg;</sup> Bene<em>FIT</em>&trade; 52% Whole Grain Biscuit Dough<br />
            READI-BAKE<sup>&reg;</sup> Bene<em>FIT</em>&trade; 51% Whole Grain Double Chocolate Chip</p>
            </td>
        </tr>
        <tr>
            <td width="200" valign="top">J.M. Swank<br />
            (319) 626-5907</td>
            <td width="400" valign="top">Ultragrain<sup>&reg;</sup> Macaroni Noodles</td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top">Integrated Food Service<br />
            (310) 523-3664</td>
            <td width="400" valign="top">Hot Off The Grill&trade; Grilled Cheese Sandwich<br />
            Hot Off The&trade; Grill Cinnamon Toast</td>
        </tr>
        <tr>
            <td width="200" valign="top">Monarch Food Group<br />
            (770) 723-8148</td>
            <td width="400" valign="top">Hilltop Hearth<sup>&reg;</sup> Pullman Loaf made with Whole Grains</td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top">Pepperidge Farm<br />
            (800) 879-7687</td>
            <td width="400" valign="top">Cheddar Goldfish<sup>&reg;</sup> Made With Whole Grain</td>
        </tr>
        <tr>
            <td width="200" valign="top"><a href="http://www.ralcorpfrozen.com/index.php?idrub=5&amp;page=contactus" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Ralcorp Frozen Bakery Products</span></strong></a><br />
            (630) 455-5200</td>
            <td width="400" valign="top">Krusteaz<sup>&reg;</sup> Waffles made with Ultragrain<sup>&reg;</sup><br />
            Krusteaz<sup>&reg;</sup> Pancakes made with Ultragrain<sup>&reg;</sup></td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td width="200" valign="top">Silver Lake Cookie Company, Inc.<br />
            (800) 645-9048</td>
            <td width="400" valign="top">Premium Chocolate Chip Cookies<br />
            Premium Oatmeal Raisin Cookies<br />
            Premium Oatmeal White Chocolate Cranberry Cookies</td>
        </tr>
        <tr>
            <td width="200" valign="top">Super Bakery Inc.<br />
            (800) 722-6841</td>
            <td width="400" valign="top">
            <p>Ultra<sup>&reg;</sup> Whole Wheat Mini Loaf<br />
            Ultra<sup>&reg;</sup> Very Berry Whole Wheat Muffins<br />
            Ultra<sup>&reg;</sup> WDreamy Orange Whole Wheat Mini Loafs</p>
            </td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td align="center" colspan="2"><span style="color: rgb(153, 51, 0);"><strong>North Central Distribution</strong></span></td>
        </tr>
        <tr>
            <td width="200" valign="top"><a href="http://www.greatnorthernbaking.com/" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Great Northern Baking Company</span></strong></a><br />
            (612) 331-1043</td>
            <td width="400" valign="top">Baked Cookies<br />
            Baked Danish<br />
            Baked Muffins<br />
            Cinnamon Rolls<br />
            Snackbreads</td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td align="center" colspan="2"><span style="color: rgb(153, 51, 0);"><strong>Northeast Distribution</strong></span></td>
        </tr>
        <tr>
            <td width="200" valign="top"><a href="http://www.lepagebakeries.com/" target="_blank"><strong><span style="color: rgb(255, 102, 0);">Lepage Bakeries/Country Kitchen</span></strong></a><br />
            (207) 783-9161</td>
            <td width="400" valign="top">Country Kitchen Whole Grain White Bread<br />
            Country Kitchen Bakers' Select Whole Grain 100% Whole White Bread</td>
        </tr>
        <tr bgcolor="#f9f5e8">
            <td align="center" colspan="2"><span style="color: rgb(153, 51, 0);"><strong>Contains Sustagrain<br />
            </strong></span></td>
        </tr>
        <tr>
            <td width="200" valign="top"><strong><span style="color: rgb(255, 102, 0);">Kelloggs</span></strong><br />
            (877) 511-5777</td>
            <td width="400" valign="top">Pop-Tarts<sup>&reg;</sup> One Serving of Whole Grain toaster pastries</td>
        </tr>
    </tbody>
</table>
                                                         """
                                ).save()

                             def incorporatingText = new PageText(name:"incorporating_whole_grains_in_schools", content:"""
<h1>Incorporating Whole Grains Into School Menus</h1>
<p>
  <img width="275" height="178" align="left" style="width: 81px; height: 56px;" alt="" src="/SuperKids/images/healthierschoolchallengelog.jpg" />
  <img width="106" height="287" align="right" alt="" src="/SuperKids/images/NEWGIRLeatingpizzaVERTICAL.jpg" />
  <strong>SuperKids is the foodservice program that supports your effort to achieve gold certification.</strong> Under the Healthier U.S. School Challenge for Elementary Schools, gold certification standards apply to public school district lunch programs that offer whole grain foods each day. SuperKids helps you provide more great-tasting whole grain menu options. It's one of the most efficient ways to get our nation's students to eat healthier.
</p>
<h2>This is the fourth year that SuperKids has offered free samples of whole grain products to foodservice directors.</h2>
<p>
  In the last three years, K-12 students have given the whole grain foods they sampled extremely high marks. A major reason: the foods were made with the appealing color, taste and texture of Ultragrain flour.
</p>
<p>
  SuperKids products made with Sustagrain offer another way to increase whole grain and fiber consumption in school lunches. In flour form, Sustagrain can be used in baked goods, meat preparations, sauces and dips. In flake form, it works great in desserts, hot cereals and snacks.
</p>
<p>
  Thanks to Ultragrain and Sustagrain, and products made with these ingredients, the SuperKids program has helped foodservice directors add more whole grain nutrition into their menus.</p>	
                                                         """
                                ).save()

                             def brokerParticipateText = new PageText(name:"broker_participate", content:"""
<h1>How You Can Participate</h1><br />
<h2>An Important Role.</h2>
<p>Foodservice distributors and brokers can play a significant role in getting more whole grain foods into our nation's schools. One of the biggest ways you can participate is by promoting products offered in the SuperKids program to the school districts you serve.</p>
<h2>Demand Reports.</h2>
<p>If your company is listed as the one that serves a school district and that school district provides feedback to us about the whole grain products sampled, you will receive that data in a Demand Report.</p>
<h2>Talk With SuperKids Manufacturers.</h2>
<p>SuperKids product manufacturers would like to discuss their products with you. In addition, we would welcome your help in making brokers and foodservice directors aware of these products. You can send eCards to them, as well as ask the manufacturers whose products are presented here to contact you.</p>
<p><strong>Send an eCard or Request Contact from our participating manufacturers by selecting these options from the menu on the left.</strong></p>	
                                                         """
                                ).save()

                             def publicDietsStudentsText = new PageText(name:"public_diets_students", content:"""
<h1>Give Students Whole Grain Goodness</h1><br />
<img height="350" alt="" hspace="5" width="112" align="right" src="/SuperKids/images/SATUBREADSLICESMALLVERT.jpg" />
<h2>You can use Ultragrain at home</h2>
<p>in your favorite recipes with Eagle Mills All-Purpose Flour made with Ultragrain. It contains 9 grams of whole grains per serving, looks, tastes and bakes like white flour and is available in many grocery stores across the country. Contact your grocer if Eagle Mills Flour made with Ultragrain is not on the shelf.</p>
<h2>Many foods are made with Ultragrain.</h2>
<p>In fact, more and more food companies are planning to add Ultragrain as a way to increase the whole grain goodness of their foods. A few of the well-known products currently on the market that feature Ultragrain include:</p>
<p><strong><span style="color: #993300">Herr's<sup>&reg;</sup> Whole-Grain Pretzel Sticks</span></strong>&mdash;Rich flavor, low in fat, good source of whole grains and&nbsp;higher in fiber than most pretzels.</p>
<p><strong><span style="color: #993300">Kid Cuisine<sup>&reg;</sup> Dip &amp; Dunk Cheese Pizza Strips, Carnival Corn Dogs and Cheeseburger</span></strong>&mdash;Microwave them in minutes. Each contains a main dish, vegetable and a fun activity. With the added benefits of Ultragrain's whole grain nutrition, you can feel good about serving Kid Cuisine to your kids.</p>
<p><strong><span style="color: #993300">Lightlife</span></strong>&mdash;A leader in vegetarian meals, Lightlife uses Ultragrain in its popular Smart Tortilla Wraps.</p>
<p><strong><span style="color: #993300">Pepperidge Farm<sup>&reg;</sup> Whole Grain Goldfish<sup>&reg;</sup> Crackers</span></strong>&mdash;A longtime favorite of kids and adults for snacking. Each serving contains one-half serving of whole grains.</p>
<p><strong><span style="color: #993300">Sara Lee<sup>&reg; </sup></span></strong></p>
<ul>
    <li><span style="color: #000000"><span style="font-size: x-small">Sara Lee Soft &amp; Smooth 100% Whole Wheat Bread </span></span></li>
    <li><span style="color: #000000"><span style="font-size: x-small">Sara Lee Hearty &amp; Delicious All-Natural 100% Whole Grain breads </span></span></li>
    <li><span style="color: #000000"><span style="font-size: x-small">Sara Lee Made With Whole Grain Hot Dog Buns, White Hamburger Buns and English Muffins </span></span></li>
    <li><span style="color: #000000"><span style="font-size: x-small">Sara Lee Plain Bagels made with Ultragrain</span></span><span style="font-size: x-small"> </span></li>
</ul>
                                                         """
                                ).save()

	}
}

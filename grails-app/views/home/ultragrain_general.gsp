<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <sec:ifLoggedIn>
            <meta name="layout" content="learn" />
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <meta name="layout" content="public" />
        </sec:ifNotLoggedIn>

        <meta name="link" content="about" />
        <title>SuperKids | About Ultragrain</title>
    </head>
    <body>
		<div id="contentInsetInner">
			<div style="width:620px;">
				<h1>About Ultragrain<sup>&reg;</sup></h1><br/> <br/>

				<div style="float: left; width: 600px">
					<img style="width:200px; height:195px; float:right" alt="" src="${resource(dir:'images', file:'UltraGrainlogo.jpg')}" />
					<p><strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><img style="width:90px; height:280px; float:left"  hspace="5" src="${resource(dir:'images', file:'SATUBREADSLICESMALLVERT(1).jpg')}" alt="" />Ultragrain is an all-natural, 100% whole wheat flour </span></span></strong>that combines the nutritional benefits of whole grains with the finished recipe qualities of traditional refined flour. Products available for sampling in the SuperKids program demonstrate the use of whole wheat flour instead of refined white flour, with a major difference: Ultragrain delivers the best of both worlds&mdash;whole grain nutrition and refined white flour appeal. </p>
					<p>Ultragrain can be found in many consumer foods across the nation. In fact, you may already be enjoying products made wtih Ultragrain and not even know it.</p>
					<p>Ultragrain is the whole grain flour used in many packaged foods like whole grain crackers, pasta, pizza and bread, including the popular Sara Lee Soft &amp; Smooth Whole Grain White Bread, Kid Cuisine meals and Chef Boyardee Forkables. Ultragrain can also be found in Eagle Mills All-Purpose Flour, a blend of 30% Ultragrain and 70% premium white flour, which can be used as a direct replacement for white or bread flour in any recipe, making already delicious recipes more nutritious. Eagle Mills All-Purpose Flour offers 9 grams of whole grains per &frac14; cup serving.</p>

					<p>Ultragrain is also included in many other grocery, school cafeteria and restaurant items, from buns, rolls, tortillas, muffins, and noodles to pizza, waffles, French toast sticks, cookies, pretzels, and snack and cereal bars.</p>
					<p><strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;">Products that use Ultragrain are award winners.</span></span></strong> In addition to the Golden Shopping Cart award for Eagle Mills flour made with Ultragrain, products with Ultragrain have received accolades from <em>Business Week</em>, including being named one of the &quot;Best Products of 2005&quot; for being the flour power behind Sara Lee's Soft &amp; Smooth Whole Grain White Bread.</p>
					<p>Ultragrain was also singled out by <em>Prepared Foods</em> magazine with a &quot;Spirit of Innovation Award&quot; in the Foodservice Category for The Max whole grain line of pizzas with Ultragrain, served in schools across the country.</p>

					<p><strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><span class="bu">Ultragrain's patented manufacturing process</span></span></span></strong><span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><span><strong><span class="bu"> </span></strong></span></span></span><img width="150" vspace="5" hspace="5" height="97" align="left" src="/SuperKids/images/whats-ultragrain2.jpg" alt="" />delivers whole grain flour with the same particle size as traditional refined white flour.</p>
					<p>The milling of Ultragrain allows it to retain the fiber, protein, vitamins, minerals and other phytonutrients concentrated within the bran and germ. Ultragrain also uses special wheat selected for its mild flavor and light color. The combination of special wheat and patented milling results in a whole grain wheat flour with a taste, ultra smooth texture and appearance similar to traditional refined white flour.</p>
				</div>
				
				<div class="clear">&nbsp;</div>
			
			</div>
		</div>
	</body>
</html>

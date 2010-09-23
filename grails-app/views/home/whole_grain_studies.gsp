

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="learn" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>
<script> 
function popup(id){
	var total = 12;
	for(i=1; i <= total; i++)
	{
		var temp = "PopUp" + i;
		if(id != temp)
			{
				document.getElementById(temp).style.display = "none";
			}
	}
	document.getElementById(id).style.display = "block";
}
function popaway(id){
	document.getElementById(id).style.display = "none";
}
\S 
</script> 
        <div style="width:450px">
           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
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

        </div>
<div class="PopUpClass" id="PopUp1"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span><span style="font-size: medium;"><strong>Less Acne</strong><br /> 
</span></span></span>Australian researchers led by Neil Mann recruited 50 young males (age 15-25) with mild to moderate acne for a twelve-week study of the relationship between diet and acne. Half the group ate a typical Western diet, while the other half ate lean meat, poultry, fish, fruits, vegetables and substituted whole grain bread, cereals and rice for refined foods. After twelve weeks, the acne of the group eating more protein and whole grains &quot;improved dramatically by more than fifty percent.&quot;&nbsp; <em>Journal of Dermatological Science, Apr 2008;50(1):41-52. Epub Jan 4, 2008. <br /> 
</em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp1');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp2"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span><span style="font-size: medium;"><strong>Reduced Chronic Disease Risk</strong><br /> 
</span></span></span>A team of scientists in Boston and Baltimore led by PK Newby studied data from the Baltimore Longitudinal Study of Aging, and found that seniors consuming the most whole grain had lower body mass index (BMI) and weight, and smaller waist circumference. More whole grain consumption was also associated with lower total cholesterol, lower LDL cholesterol and improved glucose response. <em>Am. Journal of Clinical Nutrition, Dec 2007; vol 86(6): 1745-1753 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp2');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp3"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Lower Body Mass Index (BMI)</strong><br /> 
</span></span>UK researchers Janice Harland and Lynne Garton pooled data from fifteen studies on whole grain intake and BMI or adiposity, and found that in 119,829 male and female subjects age 13 or older, a higher intake of whole grains (about three servings per day) was associated with lower BMI and less central adiposity (abdominal fat). <em>Public Health Nutrition, Nov 16, 2007; 1-10.&nbsp; </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp3');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp4"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Pancreatic Cancer</strong><br /> 
</span></span>Pancreatic cancer is the most fatal cancer in the U.S., but eating two servings or more of whole grains daily may cut the risk of this swift and deadly killer by up to 40%. That was the finding of researchers at UC San Francisco led by June Chan, who compared diets of 532 pancreatic cancer patients with 1,701 people not suffering from the disease. <em>The American Journal of Epidemiology, November 2007; 166(10):1174-1185 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp4');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp5"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Healthier Hearts</strong><br /> 
</span></span>After following 21,376 male physicians for almost 20 years, Luc Djouss&eacute; and J. Michael Gaziano at Harvard found that those eating two to six servings of whole grain cereal a week reduced their risk of heart failure 22%, while those eating whole grains daily reduced risk by 28%. For this study, cereals with at least 25% whole grain or bran by weight were classified as whole grain. <em>Archives of Internal Medicine, October 2007; 167: 2080-2085 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp5');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp6"> 
<div class="headline2"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></div> 
<div style="font-size: 10px;"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Hypertension Risk</strong><br /> 
</span></span>Researchers at Harvard studied nearly 30,000 enrolled in the Women's Health Study. Lu Wang's team found that, over ten years, those who ate the most whole grains had an 11% lower chance of developing high blood pressure. <em>Am. Journal of Clinical Nutrition, Aug 2007; vol 86(2):472-9 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp6');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp7"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Diabetes Risk</strong></span><br /> 
</span>Also at the Harvard School of Public Health, researchers led by JS de Munter pooled data from six cohort studies including 286,125 participants, and found that a two-servings a day increment in whole grain consumption was associated with a 21% decrease in risk of type 2 diabetes. <em>PLoS Medicine, August 2007; 28;4(8):e261 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp7');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp8"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Healthier Carotid Arteries</strong><br /> 
</span></span>A study by Philip Mellen at Wake Forest University and colleagues measured atherosclerosis of the common carotid artery, and its progression over five years. Mellen's team found that, among the 1178 men and women in the study, those who ate more whole grains had less unhealthy artherosclerotic thickening of the common carotid artery.&nbsp; <em>Am. Journal of Clinical Nutrition, June 2007; vol 85(6):1495-1502 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp8');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp9"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Colorectal Cancer</strong></span><br /> 
</span>A team of researchers led by Arthur Schatzkin studied data for almost half a million middle-aged men and women enrolled in the NIH-AARP Diet and Healthy Study, to learn whether fiber intake and/or whole grains might reduce the risk of colorectal cancer. In this analysis, total dietary fiber intake was not associated with a reduced risk of colorectal cancer, but both grain fiber and whole grains were shown likely to reduce the risk of colorectal cancer. <em>Am. Journal of Clinical Nutrition, May 2007; vol 85(5):1353-1360 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp9');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp10"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Breast Cancer</strong><br /> 
</span></span>A UK study suggests that women who eat large amounts of fiber could cut breast cancer risk in half. The effect was greatest on pre-menopausal women, which Janet Cade and her team at Leeds University say may be because fiber affects the way the body processes and regulates the female hormone estrogen. <em>International Journal of Epidemiology, April 2007; 36(2):431-8 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp10');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp11"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Reduced Risk of Childhood Asthma</strong><br /> 
</span></span>A team from the Dutch National Institute of Public Health and the Environment found that children who ate whole grains were 54% less likely to develop asthma and 45% less likely to develop wheezing than children who did not eat whole grains. <em>Thorax, December 2006; 61(12):1048-53 </em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp11');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
<div class="PopUpClass" id="PopUp12"> 
<div class="headline2"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Whole Grains And Human Health - Recent Studies</span></span></div> 
<div style="font-size: 10px;"><span style="color: rgb(0, 0, 0);"><span style="font-size: xx-small;">Copyright, The Whole Grains Council</span></span></div> 
<br /> 
<br /> 
<span style="color: rgb(153, 51, 0);"><span style="font-size: medium;"><strong>Help For Overweight Children</strong><br /> 
</span></span>Overweight children, age 9-15, spent two weeks on an all-you-can-eat diet of whole grains, fruits, vegetables and lean protein, while exercising 2.5 hours each day. UCLA researchers led by Dr. James Barnard reported that in just two weeks the children's cholesterol levels dropped an average of 21%, while insulin levels fell 30%. Leptin, a hormone thought to be connected to appetite, decreased on average 57%.&nbsp; <em>(Study presented at American Heart Assn. conference, Mar. 2006.)</em> 
<div style="text-align: right;"><a style="font-size: 12px;" onclick="popaway('PopUp12');" onfocus='this.blur();' onmouseover='this.style.cursor="pointer" '><span style="text-decoration: underline;">Close</span></a></div> 
</div> 
    </body>
</html>

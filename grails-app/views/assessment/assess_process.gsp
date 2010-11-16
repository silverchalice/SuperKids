

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <meta name="currentProductId" content="0" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>Product Assessment | SuperKids</title>
		<style type="text/css">
			#contentInsetUpper {
				width:601px;
				left:309px;

			}

			#contentInsetInner {
				width:581px;
				position:relative;
				left:40px;
			}

			#contentInsetLower {
				width:601px;
				left:309px;
			}
		</style>
    </head>
    <body>
        <div id="contentInsetInner" >
			<br/>
            <h1>Begin Online Assessment</h1>   <br/>
			<h2>How To Assess Your SuperKids Products</h2><br/>
			<img src="${resource(dir:'images', file:'arrowforassessmentpage.jpg')}" style="width:150px; height:60px; float:left; margin:30px 0" /><p>The product samples you ordered&nbsp;are listed vertically on the left. To complete your assessment of these products, do the following:&nbsp;</p>

			<p><span style="color: rgb(0, 0, 0);">1.&nbsp; Click in the white area shown to begin an assessment of the product.</span></p>
			<p><span style="color: rgb(0, 0, 0);">2.&nbsp; If you ordered but didn't receive a sample product,&nbsp;check the&nbsp;&quot;Did Not Receive?&quot;&nbsp;box.&nbsp;&nbsp; </span></p>

			<h2>Thanks For Your Feedback!</h2>    <br/>
			<p>Product assessments&nbsp;are instrumental in helping our manufacturers&nbsp;develop new&nbsp;products, and will help foodservice distributors stock the items you like most.</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
        </div>
		<script type="text/javascript">
			jQuery.noConflict();

			jQuery(document).ready(function() {
				jQuery('.assessmentProduct').hover(
						function(){jQuery(this).addClass("assessmentProductHover")},
						function() {jQuery(this).removeClass("assessmentProductHover")});
			});
		</script>
    </body>
</html>

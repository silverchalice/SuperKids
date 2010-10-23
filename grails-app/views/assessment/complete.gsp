

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <meta name="currentProductId" content="0" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>SuperKids | Online Assessment 1/4</title>
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
        <div id="contentInsetInner">
            <h1>${assessmentInstance?.product?.name}</h1>
			
				<div id="assessmentQuestionUpper">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner" style="padding-bottom:39px"><br />
                    <p style="font-size:14px;">
						You have completed your assessment of this product. If you have other products waiting to be assessed, click on them one at a time to continue assessing them. 
                    </p>
                </div>

				<div id="assessmentQuestionLower" style="top:236px">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

        </div>
    </body>
</html>

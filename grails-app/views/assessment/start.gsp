

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <meta name="currentProductId" content="${product?.id}" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>SuperKids | Online Assessment</title>

    </head>
    <body>

    <div id="content-container">
        <div id="content">
            <img src="img/img_money_books.jpg" class="left money-books" alt="Four stacked books with hundred dollar bills used as bookmarks" />
            <h1>Your School Could Win Free Money!</h1>
            <p>Just tell us what you thought about this year’s SuperKids lineup and you’ll be automatically entered to win <strong>up to $200</strong> for your school district.</p>
            <p>Remember, your feedback is invaluable. It not only lets us know how to improve our SuperKids program, it helps manufacturers better understand your needs. For prizes and official rules, <a href="#">click here</a>.</p>
            <hr />

            <g:each in="${products}" var="product">

                <div class="order-item expanded"> <img src="img/img_pizza.jpg" />
                    <h2>${product?.title}</h2>
                    <p>${product?.sponsor?.name}</p>
                    <div class="expand"><a href="#">Review this product</a> </div>
                    <form>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="first">
                                    <label for="thoughts">What thoughts do you have about this product?</label>
                                    <textarea name="thoughts"></textarea>
                                </td>
                                <td><label for="taste">On a scale of 1-5 how would you rate this product’s taste?</label>
                                    <ol>
                                        <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                        <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                        <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                        <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                        <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                    </ol>
                                    <label for="taste">On a scale of 1-5 how would you rate this product’s nutrition?</label>
                                    <ol>
                                        <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                        <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                        <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                        <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                        <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                    </ol>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <div class="complete-review"><a href="#" class="clear">Clear this review</a> <a href="#" class="btn complete"><span>Complete this product review</span></a></div>
                </div>

            </g:each>




            <div class="order-item collapsed"> <img src="img/img_holder.jpg" />
                <h2>Product Name</h2>
                <p>Made by Company Name with Grain</p>
                <div class="expand"><a href="#">Review this product</a> </div>
                <form>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                <label for="thoughts">What thoughts do you have about this product?</label>
                                <textarea name="thoughts"></textarea>
                            </td>
                            <td><label for="taste">On a scale of 1-5 how would you rate this product’s taste?</label>
                                <ol>
                                    <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                    <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                    <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                    <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                    <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                </ol>
                                <label for="taste">On a scale of 1-5 how would you rate this product’s nutrition?</label>
                                <ol>
                                    <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                    <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                    <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                    <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                    <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                </ol>
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="complete-review"><a href="#" class="clear">Clear this review</a> <a href="#" class="btn complete"><span>Complete this product review</span></a></div>
            </div>
            <div class="order-item collapsed"> <img src="img/img_holder.jpg" />
                <h2>Product Name</h2>
                <p>Made by Company Name with Grain</p>
                <div class="expand"><a href="#">Review this product</a> </div>
                <form>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                <label for="thoughts">What thoughts do you have about this product?</label>
                                <textarea name="thoughts"></textarea>
                            </td>
                            <td><label for="taste">On a scale of 1-5 how would you rate this product’s taste?</label>
                                <ol>
                                    <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                    <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                    <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                    <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                    <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                </ol>
                                <label for="taste">On a scale of 1-5 how would you rate this product’s nutrition?</label>
                                <ol>
                                    <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                    <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                    <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                    <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                    <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                </ol>
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="complete-review"><a href="#" class="clear">Clear this review</a> <a href="#" class="btn complete"><span>Complete this product review</span></a></div>
            </div>
            <div class="order-item collapsed"> <img src="img/img_holder.jpg" />
                <h2>Product Name</h2>
                <p>Made by Company Name with Grain</p>
                <div class="expand"><a href="#">Review this product</a> </div>
                <form>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                <label for="thoughts">What thoughts do you have about this product?</label>
                                <textarea name="thoughts"></textarea>
                            </td>
                            <td><label for="taste">On a scale of 1-5 how would you rate this product’s taste?</label>
                                <ol>
                                    <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                    <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                    <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                    <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                    <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                </ol>
                                <label for="taste">On a scale of 1-5 how would you rate this product’s nutrition?</label>
                                <ol>
                                    <li class="first"><label for="1">1</label> <input type="radio" name="taste" value="1" /></li>
                                    <li><label for="2">2</label> <input type="radio" name="taste" value="2" /></li>
                                    <li><label for="3">3</label> <input type="radio" name="taste" value="3" /></li>
                                    <li><label for="4">4</label> <input type="radio" name="taste" value="4" /></li>
                                    <li class="last"><label for="5">5</label> <input type="radio" name="taste" value="5" /></li>
                                </ol>
                            </td>
                        </tr>
                    </table>
                </form>
                <div class="complete-review"><a href="#" class="clear">Clear this review</a> <a href="#" class="btn complete"><span>Complete this product review</span></a></div>
            </div>
            <hr />
            <a href="#" title="Move to the next step" class="btn arrow"><span>Submit your reviews</span></a> </div>
    </div>



















        <div id="contentInsetInner">
            <h1>${product?.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assessmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${assessmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="lc" >
                <g:hiddenField name="productId" value="${id}" />
                <g:hiddenField name="customerId" value="${customerId}" />

				<div id="assessmentQuestionUpper">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner"><br />
				  <p style="position:absolute; top:1px; left:345px; font-size:14px">Assessment Question 1 of 4</p>
                  <p style="font-size:14px;">
                    <label>On a scale of 1 to 5 where 1 is 'not liked' and 5 is 'well liked', how did you like this product?</label> <br/><br/><br/>
                    <label style="margin-left:20px"><input type="radio" name="likeRating" value="1" >1</label>
                    <label><input type="radio" name="likeRating" value="2" >2</label>
                    <label><input type="radio" name="likeRating" value="3" >3</label>
                    <label><input type="radio" name="likeRating" value="4" >4</label>
                    <label><input type="radio" name="likeRating" value="5" >5</label>
                    <g:hiddenField name="product.id" value="${product?.id}" />

                   <g:if test="${product?.id == 23}">
                       <g:hiddenField name="pasta" value="true" />

                   </g:if>

                  </p>
                </div>

				<div id="assessmentQuestionLower" style="top:222px">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

                <input type="submit" id="continueAssessment" value="" />
            </g:form>
        </div>

		<script type="text/javascript">
			jQuery.noConflict();

			jQuery(document).ready(function() {
				var changedFlag;
				jQuery(':input').bind('change', function() {
			    //console.log('changedFlag = true')
				changedFlag = 'true';
				});

				jQuery('#continueAssessment').click(function (e) {
					if(changedFlag == 'true') {
						return true
					}
					else {
						alert('No rating selected');
						return false
					}
				});

			});
		</script>

    </body>
</html>

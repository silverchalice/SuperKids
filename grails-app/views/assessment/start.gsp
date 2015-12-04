

<%@ page import="com.superkids.domain.Assessment" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="assess_landing" />

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.8.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui-1.8.23.custom.min.js')}"></script>
    <link type="text/css" href="${resource(dir: 'css', file: 'ui-lightness/jquery-ui-1.8.23.custom.css')}" rel="Stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('.complete').click(function(e){
                closeOrderItem(this.id);
                e.preventDefault();
            });


            $('.expand a').click(function(e){
                openOrderItem(this.id);
                e.preventDefault();
            });

            $(".submitButton").click(function () {
                $("#saveAssessments").submit();
            });

        });

        function closeOrderItem(id) {
            var form = "#form_" + id;
            jQuery(form).removeClass('expanded', 400).addClass('collapsed', 400);
        }

        function openOrderItem(id) {
            var form = "#form_" + id;
            jQuery(form).removeClass('collapsed', 10).addClass('expanded', 400);
        }

        function disableItemForm(id) {
            var form = "#form_" + id;
            jQuery(form).removeClass('expanded', 400).addClass('collapsed', 400);


        }

    </script>

    <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
    <title>SuperKids | Online Assessment - Step 1</title>

<style type="text/css">
  p.assess { padding-top: 10px; }
</style>
</head>
<body>

    <div id="content-container">
        <div id="content">
            <img src="${resource(dir: 'images', file:'img_money_books.jpg')}" class="left money-books" alt="Four stacked books with hundred dollar bills used as bookmarks" />
            <h1>THANK YOU FOR FILLING OUT OUR SAMPLE ASSESSMENTS!
            </h1>

            <div class="order-item expanded alert">

                <h3>Please Note!</h3>
                <p>In order to submit your asssessments, you must click the <strong>"Submit Your Assessments"</strong> button at the bottom of the page: </p>

                <div>

                </div>

            </div>

            <g:form action="saveAssessments" name="saveAssessments">
                <g:each in="${products}" var="product" status="i">
                    <div id="form_${product.id}" class="order-item ${i == 0 ? 'expanded' : 'collapsed'}"> <img src="${createLink(controller: 'product', action: 'displayImage', id: product.id)}" alt="${product.name}" />
                        <h2>${product?.name}</h2>
                        <p>Made by ${product?.sponsor?.name}</p>
                       <div class="expand"><a id="${product?.id}" href="#">Assess this product</a> </div>
                       <hr >
                       <p>Did Not Receive Sample <g:checkBox name="assessment.${product.id}.didNotReceive" onclick="disableItemForm(${product.id});"/> &nbsp; &nbsp; Did Not Try Sample <g:checkBox name="assessment.${product.id}.didNotSample" onclick="disableItemForm(${product.id});"/></p>

                                  <p>&nbsp;</p>
                                  <p>&nbsp;</p>
                                  <p class="assess" style="margin-right: 20px;">On a scale of 1-5 (1-very low; 5-very high), please rate your interest in adding this item to your school menu:</p>
                                                                      <ol style="display: inline; margin-bottom: 5px; margin-left: 5px;">
                                                                          <li class="first"><label for="1">1</label> <input type="radio" name="assessment.${product.id}.likeRating" value="1" /></li>
                                                                          <li><label for="2">2</label> <input type="radio" name="assessment.${product.id}.likeRating" value="2" /></li>
                                                                          <li><label for="3">3</label> <input type="radio" name="assessment.${product.id}.likeRating" value="3" /></li>
                                                                          <li><label for="4">4</label> <input type="radio" name="assessment.${product.id}.likeRating" value="4" /></li>
                                                                          <li class="last"><label for="5">5</label> <input type="radio" name="assessment.${product.id}.likeRating" value="5" /></li>
                                                                      </ol>




                                    <p>&nbsp;</p>
                                    <p class="assess">What things did you like most (list as many as necessary)?</p>
                                    <textarea style="margin-left: 20px;" name="assessment.${product.id}.likeComment"></textarea>  <br/><br/><br/><br/><br/>
                                    <p class="assess">What things would you change (list as many as necessary)?</p>
                                    <textarea style="margin-left: 20px;" name="assessment.${product.id}.changeComment"></textarea>

                        <div class="complete-review"><a id="${product.id}" href="#" class="btn complete"><span>Close this assessment</span></a></div>
                    </div>

                </g:each>
            </g:form>



            <hr />
            <a href="#" id="submitForm" title="Move to the next step" class="btn arrow submitButton"><span>Submit Your Assessments</span></a>
        </div>
    </div>

</body>
</html>

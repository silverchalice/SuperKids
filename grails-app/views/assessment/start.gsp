

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

</head>
<body>

    <div id="content-container">
        <div id="content">
            <img src="${resource(dir: 'images', file:'img_money_books.jpg')}" class="left money-books" alt="Four stacked books with hundred dollar bills used as bookmarks" />
            <h1>Your School Could Win Free Money!</h1>
            <p>Just tell us what you thought about this year’s SuperKids lineup and you’ll be automatically entered to win <strong>up to $2,000</strong> for your school district.</p>
            <p>Remember, your feedback is invaluable. It not only lets us know how to improve our SuperKids program, it helps manufacturers better understand your needs. For prizes and official rules, <a href="/uploads/AssessmentFormRules.pdf">click here</a>.</p>
            <hr />

            <g:form action="saveAssessments" name="saveAssessments">
                <g:each in="${products}" var="product" status="i">
                    <div id="form_${product.id}" class="order-item ${i == 0 ? 'expanded' : 'collapsed'}"> <img src="${createLink(controller: 'product', action: 'displayImage', id: product.id)}" alt="${product.name}" />
                        <h2>${product?.name}</h2>
                        <p>Made by ${product?.sponsor?.name}</p>
                       <div class="expand"><a id="${product?.id}" href="#">Assess this product</a> </div>

                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="2">
                                <p>Did Not Receive Sample <g:checkBox name="assessment.${product.id}.didNotReceive" onclick="disableItemForm(${product.id});"/> Did Not Try Sample <g:checkBox name="assessment.${product.id}.didNotSample" onclick="disableItemForm(${product.id});"/></p>
                            </td></tr>
                            <tr>

                                <td class="first">
                                    <label for="assessment.${product.id}.likeComment">What things did you like most (list as many as necessary)?</label>
                                    <textarea name="assessment.${product.id}.likeComment"></textarea>  <br/><br/><br/><br/><br/>
                                    <label for="assessment.${product.id}.changeComment">What things would you change (list as many as necessary)?</label>
                                    <textarea name="assessment.${product.id}.changeComment"></textarea>
                                </td>
                                <td><label for="assessment.${product.id}.likeRating">On a scale of 1-5 (1-very low; 5-very high), please rate your interest in adding this item to your school menu:</label>
                                    <ol style="margin-bottom: 5px">
                                        <li class="first"><label for="1">1</label> <input type="radio" name="assessment.${product.id}.likeRating" value="1" /></li>
                                        <li><label for="2">2</label> <input type="radio" name="assessment.${product.id}.likeRating" value="2" /></li>
                                        <li><label for="3">3</label> <input type="radio" name="assessment.${product.id}.likeRating" value="3" /></li>
                                        <li><label for="4">4</label> <input type="radio" name="assessment.${product.id}.likeRating" value="4" /></li>
                                        <li class="last"><label for="5">5</label> <input type="radio" name="assessment.${product.id}.likeRating" value="5" /></li>
                                    </ol>

                                    <g:if test="${product.id == 23}">
                                        <label>Please check which varieties of the pasta you like:</label>

                                        <div style="float:left">
                                            <label><input type="checkbox" name="favorites.1" value="Penne" >Penne</label>
                                            <label><input type="checkbox" name="favorites.2" value="Spaghetti" >Spaghetti</label>
                                            <label><input type="checkbox" name="favorites.3" value="Macaroni" >Macaroni</label>
                                            <label><input type="checkbox" name="favorites.4" value="Rotini" >Rotini</label>
                                        </div>


                                        <div style="float:right">
                                            <label><input type="checkbox" name="favorites.5" value="Lasagna" >Lasagna</label>
                                            <label><input type="checkbox" name="favorites.6" value="9-Grain orzo" >9-Grain orzo</label>
                                            <label><input type="checkbox" name="favorites.7" value="Egg noodles" >Egg noodles</label>
                                        </div>


                                    </g:if>


                                </td>
                            </tr>
                        </table>

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

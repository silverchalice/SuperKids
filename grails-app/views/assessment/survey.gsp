

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
                $("#saveSurvey").submit();
            });


            function closeOrderItem(id) {
                var form = "#form_" + id;
                $(form).removeClass('expanded', 400).addClass('collapsed', 400);
            }

            function openOrderItem(id) {
                var form = "#form_" + id;
                $(form).removeClass('collapsed', 10).addClass('expanded', 400);
            }

            var checkboxes = document.getElementsByTagName('input');

            for (var i=0; i<checkboxes.length; i++)  {
              if (checkboxes[i].type == 'checkbox')   {
                checkboxes[i].checked = false;
              }
            }

        });

    </script>

    <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
    <title>SuperKids | Online Assessment - Step 2</title>

</head>
<body>

<div id="content-container">
    <div id="content">
        <img src="${resource(dir: 'images', file:'img_money_books.jpg')}" class="left money-books" alt="Four stacked books with hundred dollar bills used as bookmarks" />
        <h1>Thanks for your assessments!</h1>
        <p>Just one more step - to qualify for the prize drawing, we'd ask you to simply fill out the two questions below about this year's SuperKids program. We want to make this program work better for you!</p>
        <p>Once you've filled out these questions, click the "Submit Your Feedback" buttom at the bottom of the page.</p>
        <hr />

        <g:form name="saveSurvey" action="saveSurvey">
            <div class="order-item expanded"> &nbsp;
                <h2>Program Feedback</h2>
                <p>Please give us feedback on the SuperKids program in general. </p>
                <div class="expand">&nbsp;</div>

                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="first">
                            <g:textArea name="programFeedback" cols="75" rows="25" value="${customerInstance?.programFeedback}" />
                        </td>

                    </tr>
                </table>

                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>If you&#8217;ve participated in the SuperKids Program in the past, did you add any of the item you&#8217;ve sampled to your menu?</p>
                <div class="expand">&nbsp;</div>
                <g:select name="addedPastItemsToMenuA" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.addedPastItemsToMenuA}"/>

                <p>What is your overall perception of Ultragrain and foods made with Ultragrain?</p>
                <div class="expand">&nbsp;</div>

                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="first">
                            <g:textArea name="overallPerceptions" cols="75" rows="25" value="${customerInstance?.overallPerceptions}" />
                        </td>

                    </tr>
                </table>



                <div class="complete-review">&nbsp;</div>
            </div>

         </g:form>

        <hr />
        <a href="#" id="submitForm" title="Move to the next step" class="btn arrow submitButton"><span>Submit Your Feedback</span></a> </div>
</div>




</body>
</html>

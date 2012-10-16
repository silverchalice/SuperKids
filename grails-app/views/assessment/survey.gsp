

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


            function closeOrderItem(id) {
                var form = "#form_" + id;
                $(form).removeClass('expanded', 400).addClass('collapsed', 400);
            }

            function openOrderItem(id) {
                var form = "#form_" + id;
                $(form).removeClass('collapsed', 10).addClass('expanded', 400);
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
        <p>Just one more step - to qualify for the prize drawing, we'd ask you to simply fill out the four questions below about this year's SuperKids program. We want to make this program work better for you!</p>
        <p>Once you've filled out these questions, click the "Submit Your Feedback" buttom at the bottom of the page. That's it - you'll be automatically entered in this year's drawing!</p>
        <hr />


                <div id="form_" class="order-item expanded"> &nbsp;
                    <h2>First Survey Question</h2>
                    <p>More text goes here</p>
                    <div class="expand">&nbsp;</div>

                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                  <g:textArea name="question" cols="75" rows="25" />
                            </td>

                        </tr>
                    </table>

                    <h2>Second Survey Question</h2>
                    <p>More text goes here</p>
                    <div class="expand">&nbsp;</div>

                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                <g:textArea name="question" cols="75" rows="25" />
                            </td>

                        </tr>
                    </table>


                    <h2>Third Survey Question</h2>
                    <p>More text goes here</p>
                    <div class="expand">&nbsp;</div>

                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                <g:textArea name="question" cols="75" rows="25" />
                            </td>

                        </tr>
                    </table>


                    <h2>Fourth Survey Question</h2>
                    <p>More text goes here</p>
                    <div class="expand">&nbsp;</div>

                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="first">
                                <g:textArea name="question" cols="75" rows="25" />
                            </td>

                        </tr>
                    </table>



                    <div class="complete-review">&nbsp;</div>
                </div>


        <hr />
        <a href="#" id="submitForm" title="Move to the next step" class="btn arrow submitButton"><span>Submit Your Feedback</span></a> </div>
</div>




</body>
</html>

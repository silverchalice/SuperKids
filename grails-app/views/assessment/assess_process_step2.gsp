

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
        <h1>Your School Could Win Free Money!</h1>
        <p>Just tell us what you thought about this year’s SuperKids lineup and you’ll be automatically entered to win <strong>up to $200</strong> for your school district.</p>
        <p>Remember, your feedback is invaluable. It not only lets us know how to improve our SuperKids program, it helps manufacturers better understand your needs. For prizes and official rules, <a href="#">click here</a>.</p>
        <hr />

        <g:form action="saveFeedback" name="saveFeedback">

        </g:form>



        <hr />
        <a href="#" title="Move to the next step" class="btn arrow"><span>Submit your reviews</span></a> </div>
</div>




</body>
</html>

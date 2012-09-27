

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="about" />

        <title>SuperKids | About The Manufacturers</title>

        <style type="text/css">
            #overview .sponsorListItem img.ad {
                box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.25);
                float: right;
                margin: 0 0 10px 10px;
                padding: 2px;
                width: 200px;
                height: auto;
                border: none;
            }

            #overview a {
                background: none;
                padding: 0;
            }

            #overview .sponsorListItem {
                float:none;
                width:720px;
                clear: both;
                margin: 30px 0;
                min-height: 180px;
            }

            #overview .sponsorListItem img.sponsorLogo {
                float: left;
                height: auto;
                width: auto;
                max-height: 100px;
                border: none;
                padding: 0 10px 5px 0
            }
        </style>

    </head>
    <body>

        ${content}
                 <!--

                     <div id="overview" style="border: none">
                     <g:each in="${com.superkids.domain.Sponsor.findAllByInactive(false, [sort: 'name'])}" var="sponsor">
                     <div class="sponsorListItem">
                         <h2>${sponsor.name}</h2>
                         <a href="${sponsor.website}"><img class="sponsorLogo" src="${createLink(controller: 'sponsor', action: 'displayImage', id: sponsor.id)}" alt="${sponsor.name} logo"></a>

                         <g:each in="${sponsor.products.findAll{it.liveProduct && !it.parent}}" var="product">
                             <a href="/SuperKids/uploads/${product?.backgroundImage}" target="_blank" style="background: none;"><img class="ad" src="/SuperKids/uploads/${product?.backgroundImage}" /></a>
                         </g:each>

                         ${sponsor.description}
                     </div>
                    <hr/>
                 </g:each>       </div>
                 -->


    </body>
</html>

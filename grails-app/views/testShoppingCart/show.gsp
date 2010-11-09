<%@ page import="com.superkids.domain.Product" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="cart" />
        <title>SuperKids | Cart</title>         
        <g:javascript plugin="jquery" library="jquery" />

		<style type="text/css">
			table {
				border: 1px solid #ccc;
				width: 100%
			}
			tr {
				border: 0;
			}
			td, th {
				font: 11px verdana, arial, helvetica, sans-serif;
				line-height: 12px;
				padding: 5px 6px;
				text-align: left;
				vertical-align: top;
			}
			th {
				background: #fff url(../images/skin/shadow.jpg);
				color: #666;
				font-size: 11px;
				font-weight: bold;
				line-height: 17px;
				padding: 2px 6px;
			}
			th a:link, th a:visited, th a:hover {
				color: #333;
				display: block;
				font-size: 10px;
				text-decoration: none;
				width: 100%;
			}
			th.asc a, th.desc a {
				background-position: right;
				background-repeat: no-repeat;
			}
			th.asc a {
				background-image: url(../images/skin/sorted_asc.gif);
			}
			th.desc a {
				background-image: url(../images/skin/sorted_desc.gif);
			}

			.odd {
				background: #f7f7f7;
			}
			.even {
				background: #fff;
			}

			/* LIST */

			.list table {
				border-collapse: collapse;
			}
			.list th, .list td {
				border-left: 1px solid #ddd;
			}
			.list th:hover, .list tr:hover {
				background: #b2d1ff;
			}
		</style>
    </head>
    <body>

        <div id="contentInsetInner">

		<h1>&nbsp;&nbsp;&nbsp;Sample Cart</h1>
                    <div id="shoppingCartContent" class="flexcroll" style="width:620px; height:430px; overflow:auto;">
                      <sks:hasNotPlacedCurrentOrder>
                        <g:render template="/shopping/shoppingCartContent"/><br />
                      </sks:hasNotPlacedCurrentOrder>
                      <sks:hasPlacedCurrentOrder>
                          <sks:orderList />
                      </sks:hasPlacedCurrentOrder>

				</div>
        </div>
    </body>
</html>

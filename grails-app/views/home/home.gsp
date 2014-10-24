<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="layout" content="public" />
      <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-18800741-2']);
          _gaq.push(['_trackPageview']);

          (function() {
              var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
              ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
      </script>

</head>
	<body>
    <div id="intro-container">
          <div id="intro">
              <h1>Healthier Meals Start Here.</h1>
              <p>SuperKids is the free and convenient way to try foods and ingredients made with the whole grain goodness of Ultragrain® and Sustagrain® from a variety of trusted food companies.</p>
              <p><a href="${createLink(controller: 'home', action: 'order')}" class="btn arrow" title="Browse our free products"><span>Browse our free samples</span></a></p> <!--<a href="#" title="Learn about our order restrictions" class="note">Who can order?</a>--></p>
          </div>
        </div>
        <div id="overview">
            <h3>SuperKids <span>can help you introduce whole grain and higher-fiber options for breakfast, lunch, and snacks.</span></h3>
            <div class="col-01">
                <div>
                    <a href="${createLink(controller: 'home', action: 'about')}"><img src="${resource(dir:'images',file:'img_kids_eating_2.0.jpg')}" alt="Kids happily eating lunch" /></a>
                    <h4>About Us </h4>
                    <p>Learn more about <br />
                      the
                      SuperKids program</p>
                </div>
                <ul>

                  <li><a href="${createLink(controller: 'home', action: 'what_is')}" title="What is SuperKids?">What is SuperKids? </a></li>
                  <li><a href="${createLink(controller: 'home', action: 'superkids_products')}" title="SuperKids Products">SuperKids Products</a></li>
                  <li><a href="${createLink(controller: 'home', action: 'about_manufacturers')}" title="About the Manufacturers">About the Manufacturers</a></li>
                </ul>
          </div>
          <div class="col-02">
              <div>
                  <a href="${createLink(controller: 'home', action: 'ultragrain')}"><img src="${resource(dir:'images',file:'img_wheat_2.0.jpg')}" alt="Wheat swaying in the wind" /></a>
                  <h4>Our Grains </h4>
                  <p>Learn more about the benefits <br /> of Ultragrain&reg; and Sustagrain&reg;</p>
              </div>
            <ul>
              <li><a href="${createLink(controller: 'home', action: 'ultragrain')}" title="What is Ultragrain">What is Ultragrain&reg; </a></li>
              <li><a href="${createLink(controller: 'home', action: 'sustagrain')}" title="What is Sustagrain">What is Sustagrain&reg; </a></li>
              <li class="youtube" ><a href="http://www.youtube.com/watch?v=hvmNhAeXFsI&feature=BFa&list=UUkYwno7wIczmffbtBtgR2-Q" target="_blank" title="Ultragrain & Kalcevic Farms">Ultragrain & Kalcevic Farms</a></li>
            </ul>
          </div>
          <div class="col-03">
              <div>
              <a href="${createLink(controller: 'home', action: 'order')}"><img src="${resource(dir:'images',file:'img_product_samples_2.0.jpg')}" alt="Pizza in a school lunch" /></a>
                <h4>Product Samples </h4>
                <p>Order from our list <br />
                  of free
                  product samples</p>
                </div>
            <ul>
                <li><a href="${createLink(controller: 'home', action: 'order')}" title="Sampling Overview">Sampling Overview </a></li>
              <li><a href="/home/order#completeList" title="Complete Sample List">Complete Sample List</a></li>
              <li><a href="${createLink(controller: 'login', action: 'auth')}" title="Sampling Login">Sampling Login</a></li>
            </ul>
          </div>
          <div class="col-04"><div> <a href="${createLink(controller: 'home', action: 'learn')}"><img src="${resource(dir:'images',file:'img_lunch_ladies_2.0.jpg')}" alt="A school foodservice worker serving lunch" /></a>
            <h4>Resources</h4>
            <p>Access a range of information about our product samples</p>
          </div>
            <ul>
              <li><a href="${createLink(controller:'home', action: 'usda_standards')}" title="New USDA Standards">New USDA Standards</a></li>
              <li><a href="${createLink(controller:'home', action: 'alliance')}" title="Alliance for a Healthier Generation">Alliance for a Healthier Generation </a></li>
              <li><a href="${createLink(controller:'home', action: 'denver_schools')}" title="Denver Public Schools at SNA">Denver Public Schools at SNA</a></li>
            </ul>
          </div>
        </div>
        <div id="grains-container">
          <div id="grains">
              <h3>Meet our award-winning grains</h3>
              <div class="col-01"><img src="${resource(dir:'images',file:'logo_ultragrain_home_2.0.png')}" alt="Ultragrain logo" />
                  <h4>Ultragrain <span>Whole grain nutrition. White flour appeal.</span></h4>
                  <p>Made with specially selected white wheat and ground using all-natural patenting milling, Ultragrain<sup>®</sup> delivers 100% whole grain nutrition without sacrificing the appealing taste, texture and appearance of refined white flour. <a href="${createLink(controller: 'home', action: 'ultragrain_general')}" title="Learn more">Learn more »</a></p>
            </div>
            <div class="col-02"><img src="${resource(dir:'images',file:'logo_sustagrain_home_2.0.png')}" alt="Sustagrain logo" />
                <h4>Sustagrain <span>The highest-fiber whole grain available.</span></h4>
                <p>Sustagrain<sup>®</sup> is our unique ultra-high fiber whole grain. Made from a proprietary variety of barley—and available as ultra-fine flour or oat-like flakes—Sustagrain has a 3X the soluble and total dietary fiber of oats.  <a href="${createLink(controller: 'home', action: 'sustagrain_general')}" title="Learn more">Learn more »</a></p>
            </div>
          </div>
        </div>
	</body>
</html>

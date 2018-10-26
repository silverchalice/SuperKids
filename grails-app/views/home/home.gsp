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
              <p>SuperKids is the free and convenient way to try foods and ingredients made with the whole grain goodness of Ultragrain<sup>®</sup> from a variety of trusted food companies.</p>
              <p><a href="${createLink(controller: 'home', action: 'order')}" class="btn arrow" title="Browse our free products"><span>Browse our free samples</span></a></p> <!--<a href="#" title="Learn about our order restrictions" class="note">Who can order?</a>--></p>
          </div>
        </div>
        <div id="overview">
            <h3>SuperKids <span> can help you deliver breakfast, lunch and snack options that meet whole grain requirements and actually <strong>taste great.</strong></span></h3>
            <div class="col-01">
                <div>
                    <a href="${createLink(controller: 'home', action: 'about')}"></a>
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
                  <a href="${createLink(controller: 'home', action: 'ultragrain')}"></a>
                  <h4>Our Grains </h4>
                  <p>Learn more about the benefits <br /> of Ultragrain&reg;</p>
              </div>
            <ul>
              <li><a href="${createLink(controller: 'home', action: 'ultragrain')}" title="What is Ultragrain">What is Ultragrain&reg; </a></li>
              <li class="youtube" ><a href="http://www.youtube.com/watch?v=hvmNhAeXFsI&feature=BFa&list=UUkYwno7wIczmffbtBtgR2-Q" target="_blank" title="Ultragrain & Kalcevic Farms">Ultragrain & Kalcevic Farms</a></li>
            </ul>
          </div>
          <div class="col-03">
              <div>
              <a href="${createLink(controller: 'home', action: 'order')}"></a>
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
          <div class="col-04"><div> <a href="${createLink(controller: 'home', action: 'learn')}"></a>
            <h4>Resources</h4>
            <p>Access a range of information about our product samples</p>
          </div>
            <ul>
              <li><a href="${createLink(controller:'home', action: 'usda_standards')}" title="USDA Standards">USDA Standards</a></li>
              <li><a href="${createLink(controller:'home', action: 'association')}" title="Home Baking Association">Home Baking Association </a></li>
              <li><a href="${createLink(controller:'home', action: 'recipes')}" title="Recipes">Recipes</a></li>
              <li><a href="http://Sales-Development-Associates-Inc.dcatalog.com/v/SuperKids-Sampling-Program" target="_blank" title="SuperKids 2016 Directory">SuperKids 2016 Directory</a></li>
            </ul>
          </div>
        </div>
        <div id="grains-container">
          <div id="grains">
              <h4>Meet Our Award Winning Grain</h4>
              <div><img id="grain-logo" src="${resource(dir:'images',file:'ultragrain_logo_3.0.png')}" alt="Ultragrain logo" />
                  <h5>Ultragrain<sup>®</sup></h5>
                  <p>Made with specially selected white wheat and ground using our patented milling technique, Ultragrain<sup>®</sup> delivers 100% whole grain nutrition without sacrificing the desirable taste, texture and appearance of refined white flour. <a href="${createLink(controller: 'home', action: 'ultragrain_general')}" title="Learn more">Learn more »</a></p>
                  <img class="loaf" src="${resource(dir: 'images', file: 'img_loaf.jpg')}" alt="A sliced loaf of white bread">
            </div>
          </div>
        </div>
	</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="layout" content="public" />

</head>
	<body>
    <div id="intro-container">
          <div id="intro"> <img src="${resource(dir:'images',file:'img_home_kids.jpg')}" alt="A fun group of middle school kids" />
            <h1>Healthier Meals Start Here.</h1>
            <p><strong>What is the SuperKids Whole Grain Sampling Program?</strong> SuperKids is a unique sampling program designed to introduce whole grain and higher-fiber options for school foodservice breakfast, lunch and snacks. In fact, SuperKids provides K–12 School foodservice directors with a free and convenient way to try <a href="${createLink(controller: 'home', action: 'superkids_products')}" title="View all our products">multiple foods and ingredients</a> made with the whole grain goodness of <a href="${createLink(controller: 'home', action: 'ultragrain')}" title="Learn more about Ultragrain">Ultragrain</a>&reg; and <a href="${createLink(controller: 'home', action: 'sustagrain')}" title="Learn more about Sustagrain">Sustagrain</a>&reg;—all from a variety of trusted food companies.</p>
            <p id="cta">Directors, ready to start ordering? <a href="${createLink(controller: 'home', action: 'order')}" class="btn arrow" title="Browse our free products"><span>Browse our free samples</span></a> <!--<a href="#" title="Learn about our order restrictions" class="note">Who can order?</a>--></p>
          </div>
        </div>
        <div id="overview">
          <h3>Not Ready to Order Yet? <span>Take a look around our website to learn more about the program.</span></h3>
          <div class="col-01"> <a href="${createLink(controller: 'home', action: 'about')}"><img src="${resource(dir:'images',file:'img_kids_eating.jpg')}" alt="Kids happily eating lunch" /></a>
            <h4>About Us </h4>
            <p>Learn more about <br />
              the
              SuperKids program</p>
            <ul>

              <li><a href="${createLink(controller: 'home', action: 'what_is')}" title="What is SuperKids?">What is SuperKids? </a></li>
              <li><a href="${createLink(controller: 'home', action: 'superkids_products')}" title="SuperKids Products">SuperKids Products</a></li>
              <li><a href="${createLink(controller: 'home', action: 'about_manufacturers')}" title="About the Manufacturers">About the Manufacturers</a></li>
            </ul>
          </div>
          <div class="col-02"> <a href="${createLink(controller: 'home', action: 'ultragrain')}"><img src="${resource(dir:'images',file:'img_wheat.jpg')}" alt="Wheat swaying in the wind" /></a>
            <h4>Our Grains </h4>
            <p>Learn more about the benefits <br />
              of Ultragrain&reg; and Sustagrain&reg;</p>
            <ul>
              <li><a href="${createLink(controller: 'home', action: 'ultragrain')}" title="What is Ultragrain">What is Ultragrain&reg; </a></li>
              <li><a href="${createLink(controller: 'home', action: 'sustagrain')}" title="What is Sustagrain">What is Sustagrain&reg; </a></li>
              <li class="youtube" ><a href="http://www.youtube.com/watch?v=hvmNhAeXFsI&feature=BFa&list=UUkYwno7wIczmffbtBtgR2-Q" target="_blank" title="Ultragrain & Kalcevic Farms">Ultragrain & Kalcevic Farms</a></li>
            </ul>
          </div>
          <div class="col-03"> <a href="${createLink(controller: 'home', action: 'order')}"><img src="${resource(dir:'images',file:'img_pasta.jpg')}" alt="A pasta salad" /></a>
            <h4>Product Samples </h4>
            <p>Order from our list <br />
              of free
              product samples</p>
            <ul>
                <li><a href="${createLink(controller: 'home', action: 'order')}" title="Sampling Overview">Sampling Overview </a></li>
              <li><a href="${createLink(controller: 'home', action: 'superkids_products')}" title="Complete Sample List">Complete Sample List</a></li>
              <li><a href="${createLink(controller: 'login', action: 'auth')}" title="Sampling Login">Sampling Login</a></li>
            </ul>
          </div>
          <div class="col-04"> <a href="${createLink(controller: 'home', action: 'learn')}"><img src="${resource(dir:'images',file:'img_lunch_ladies.jpg')}" alt="Two school foodservice workers serving lunch" /></a>
            <h4>Resources</h4>
            <p>Access a range of information about our product samples</p>
            <ul>
              <li><a href="${createLink(controller:'home', action: 'usda_standards')}" title="New USDA Standards">New USDA Standards</a></li>
              <li><a href="${createLink(controller:'home', action: 'alliance')}" title="Alliance for a Healthier Generation">Alliance for a Healthier Generation </a></li>
              <li><a href="${createLink(controller:'home', action: 'chef_jeff')}" title="Chef Jeff, Denver Public Schools and Ultragrain at SNA">Chef Jeff, Denver Public Schools and Ultragrain at SNA</a></li>
            </ul>
          </div>
        </div>
        <div id="grains-container">
          <div id="grains">
            <div class="col-01"><img src="${resource(dir:'images',file:'logo_ultragrain_home.jpg')}" alt="Ultragrain logo" />
              <h4>With Ultragrain you get <span>whole grain nutrition with white flour appeal</span></h4>
              <p>Made with specially selected white wheat and ground using all-natural patenting milling, Ultragrain<sup>®</sup> delivers 100% whole grain nutrition without sacrificing the appealing taste, texture and appearance of refined white flour. <a href="${createLink(controller: 'home', action: 'ultragrain_general')}" title="Learn more">Learn more »</a></p>
            </div>
            <div class="col-02"><img src="${resource(dir:'images',file:'logo_sustagrain_home.jpg')}" alt="Sustagrain logo" />
              <h4>Sustagrain provides you <span>with the highest-fiber whole grain available</span></h4>
              <p>Sustagrain<sup>®</sup> is our unique ultra-high fiber whole grain. Made from a proprietary variety of barley—and available as ultra-fine flour or oat-like flakes—Sustagrain has a 3X the soluble and total dietary fiber of oats.  <a href="${createLink(controller: 'home', action: 'sustagrain_general')}" title="Learn more">Learn more »</a></p>
            </div>
          </div>
        </div>
	</body>
</html>

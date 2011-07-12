if (document.images) {            // Active Images
    var learnon = new Image();      
    learnon.src = "images/layout/buttons/SDA-Learn-on.gif";
	         
    learnoff = new Image(); 
    learnoff.src = "images/layout/buttons/SDA-Learn.gif";
	
    var promoteon = new Image();      
    promoteon.src = "images/layout/buttons/SDA-Promote-on.gif";
	         
    promoteoff = new Image(); 
    promoteoff.src = "images/layout/buttons/SDA-Promote.gif";
	
	var assesson = new Image();      
    assesson.src = "images/layout/buttons/SDA-Assess-on.gif";
	         
    assessoff = new Image(); 
    assessoff.src = "images/layout/buttons/SDA-Assess.gif";
	
	var orderon = new Image();      
    orderon.src = "images/layout/buttons/SDA-Order-on.gif";
	         
    orderoff = new Image(); 
    orderoff.src = "images/layout/buttons/SDA-Order.gif";
	
	var loginon = new Image();      
    loginon.src = "images/layout/buttons/SDA-Login.gif";
	         
    loginoff = new Image(); 
    loginoff.src = "images/layout/buttons/SDA-Login.gif";
	
	var logouton = new Image();      
    logouton.src = "images/layout/buttons/SDA-Logout.gif";
	         
    logoutoff = new Image(); 
    logoutoff.src = "images/layout/buttons/SDA-Logout.gif";
	
	var producton = new Image();      
    producton.src = "images/layout/buttons/OrderProductButton-on.gif";
	         
    productoff = new Image(); 
    productoff.src = "images/layout/buttons/OrderProductButton.gif";
	
	var sampleon = new Image();      
    sampleon.src = "images/layout/buttons/OrderSamplePackButton-on.gif";
	         
    sampleoff = new Image(); 
    sampleoff.src = "images/layout/buttons/OrderSamplePackButton.gif";
	
	var nutrion = new Image();      
    nutrion.src = "images/layout/buttons/OrderNutriButton-on.gif";
	         
    nutrioff = new Image(); 
    nutrioff.src = "images/layout/buttons/OrderNutriButton.gif";
	
	var manufon = new Image();      
    manufon.src = "images/layout/buttons/OrderManufButton-on.gif";
	         
    manufoff = new Image(); 
    manufoff.src = "images/layout/buttons/OrderManufButton.gif";
	
	
	
	var printthison = new Image();      
    printthison.src = "images/layout/buttons/PrintAdButton-on.gif";
	         
    printthisoff = new Image(); 
    printthisoff.src = "images/layout/buttons/PrintAdButton.gif";
	
	var viewcarton = new Image();      
    viewcarton.src = "images/layout/buttons/OrderCartButton-on.gif";
	         
    viewcartoff = new Image(); 
    viewcartoff.src = "images/layout/buttons/OrderCartButton.gif";
	
	var ordernowon = new Image();      
    ordernowon.src = "images/layout/buttons/OrderOrderButton-on.gif";
	         
    ordernowoff = new Image(); 
    ordernowoff.src = "images/layout/buttons/OrderOrderButton.gif";
	
}

// Function to 'activate' images.
function imgOn(imgName) {
        if (document.images) {
            document[imgName].src = eval(imgName + "on.src");
        }
}

// Function to 'deactivate' images.
function imgOff(imgName) {
        if (document.images) {
            document[imgName].src = eval(imgName + "off.src");
        }
}

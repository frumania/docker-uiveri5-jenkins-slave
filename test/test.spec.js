var j_username = element(by.id('j_username'));
var j_password = element(by.id('j_password'));
var logOnFormSubmit = element(by.id('logOnFormSubmit'));

var meAreaHeaderButton = element(by.id('meAreaHeaderButton'));
var signOut = element(by.id('logoutBtn'));
var okBtn = element(by.id('__mbox-btn-0'));

const config = browser.testrunner.config;

describe('test', function() {

  it('Start FLP', function() {

    /*j_username.sendKeys("info@frumania.com");
    j_password.sendKeys("J#6i/{%lY+].");
    logOnFormSubmit.click();*/

    expect(meAreaHeaderButton.isPresent()).toBeTruthy();
    meAreaHeaderButton.click();
    signOut.click();
    
    console.log("Logging Out...");
		//okBtn.click();
    //browser.sleep(2000);
    
  });

});
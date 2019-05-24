var meAreaHeaderButton = element(by.id('meAreaHeaderButton'));
var popOver = element(by.id('sapUshellMeAreaPopover'));
var signOut = element(by.id('__list0-4-logoutBtn'));
var okBtn = element(by.id('__mbox-btn-0'));

const config = browser.testrunner.config;

describe('test', function() {

  it('Start FLP', function() {

    expect(meAreaHeaderButton.isPresent()).toBeTruthy();
    meAreaHeaderButton.click();
    expect(popOver.isPresent()).toBeTruthy();	  
	  
    signOut.click();
    
    console.log("Logging Out...");
    okBtn.click();
    browser.sleep(2000);
    
  });

});

exports.config = {
	//seleniumAddress : 'http://localhost:4444/wd/hub',
	useSeleniumJar: true,
	useClassicalWaitForUI5: false,
	browserCapabilities: {
		/* maximize browser on all desktops to ensure consistent browser size */
		'chrome,chromium,firefox,ie,edge,safari': {
			'windows,mac,linux': {
			'*': {
				acceptInsecureCerts: true,
				remoteWebDriverOptions: {
					maximized: false,
					browserSize: {
						width: 1024,
						height: 768
						}
					}
				/*
			  seleniumOptions: {
				args: ['-debug', '-log','C:/work/git/openui5/selenium.log']
			  }
			  */
				}
			}
		},
		/* disable informabrs on chrome, use headless chrome on linux/jenkins*/
		'chrome,chromium': {
			'linux': {
				'*': {
					chromeOptions: {
						'args': [
							'disable-infobars',
							'--headless',
							'--disable-gpu'
							// '--window-size=1400,900'
							]/*,
						'perfLoggingPrefs': {
							'enableNetwork': true,
							'enablePage': false,
						}*/
						}/*,
					loggingPrefs: {
					performance: 'ALL',
					browser: 'ALL'
					}*/
					/*
					chromedriverOptions: {
					'enableVerboseLogging': [],
					'loggingTo': ['C:\\work\\git\\openui5\\chromedriver.log']
					}
					*/
				}
			}
		}
	},
	browsers: [{
		browserName: 'chrome',
		platformName: 'linux'
	}],
	profile : 'integration',		
	baseUrl : 'https://flpportal-p2000988657trial.dispatcher.hanatrial.ondemand.com/sites?siteId=5e2b911e-07f9-4d81-97c6-796d89bc1ea9',
	pageLoading: {
		wait: '20000',
		initialReload: false
    },
	timeouts : {
		getPageTimeout : '20000',
		allScriptsTimeout : '20000',
		defaultTimeoutInterval : '120000'
    },
	specs: 'test.spec.js',
	reporters : [
		{
		name : './reporter/screenshotReporter',
		screenshotsRoot: 'shared/results/reports/'
		},{
		name: './reporter/junitReporter',
		reportName: 'shared/results/reports/junitReport.xml'
    /*prefix: 'mySuitePrefix',
		postfix: 'mySuitePostfix'*/
	}]
};
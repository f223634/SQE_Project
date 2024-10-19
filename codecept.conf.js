exports.config = {
  output: './output',
  helpers: {
    Playwright: {
      browser: 'chromium', 
      smartWait: 3000,    
      url: 'https://github.com', 
      show: true 
    }
  },
  include: {
    I: './steps_file.js'
  },
   mocha: {},
  bootstrap: null,
  timeout: null,
  teardown: null,
  hooks: [],
    gherkin: {
    features: './features/Github_Test.feature',
    steps: ['./step_definitions/Github.js']
   },
  plugins: {
    screenshotOnFail: {
      enabled: true
    },
    allure: {
      enabled: true,
      require: 'allure-codeceptjs',
      outputDir: './allure-report'
    },
    retryFailedStep: {
      enabled: true
    },
    tryTo: {
      enabled: true
    },
    retryTo: {
      enabled: true
    },
    eachElement: {
      enabled: true
    },
    pauseOnFail: {}
  },
  stepTimeout: 0,
  stepTimeoutOverride: [{
      pattern: 'wait.*',
      timeout: 0
    },
    {
      pattern: 'amOnPage',
      timeout: 0
    }
  ], 
  tests: './DataDriven.js',
  name: 'SQE'
}

// to run any feature file 
//npx codeceptjs run --features --steps

// to run any root file 
//npx codeceptjs run --steps
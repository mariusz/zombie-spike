describe "Landing page", ->
  zombie = require("zombie")
  should = require("should")
  
  browser = new zombie.Browser()
  url = "http://localhost:3000"

  ifLoaded = (callback) ->
    browser.visit url, (e, browser) ->
      callback.call()
    jasmine.asyncSpecWait()

  it "should open", ->
    ifLoaded ->
      browser.success.should.be.ok
      jasmine.asyncSpecDone()

  it "should have a title 'Express'", ->
    ifLoaded ->
      browser.text("title").should.be.ok
      browser.text("title").should.equal("Express")
      jasmine.asyncSpecDone()

  it "should have a welcome paragraph", ->
    ifLoaded ->
      browser.text("body > p").should.be.ok
      browser.text("body > p").should.equal("Welcome to Express")
      jasmine.asyncSpecDone()


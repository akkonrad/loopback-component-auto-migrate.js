'use strict'
debug = require('debug')('loopback:component:autoMigrate')

module.exports = (app, options) ->
  debug 'initializing component'
  loopback = app.loopback
  loopbackMajor = loopback and loopback.version and loopback.version.split('.')[0] or 1
  if loopbackMajor < 2
    throw new Error('loopback-component-auto-migrate requires loopback 2.0 or newer')

  if !options or options.enabled isnt false
    autoMigrate = require (options and options.migration) || 'auto-update'
    autoMigrate(app, options)
  else
    Promise.reject(new TypeError 'component not enabled')


assert = require 'assert'

ee = require '../coffee/script/event-emitter.coffee'

describe 'EventEmitter', ->
  describe '#addListener()', ->
    it 'should add listener', ->
      emitter = new ee.EventEmitter()
      emitter.addListener 'eventname', ->
        return

      assert.ok(typeof emitter.listeners('eventname')[0] is 'function',
        'listener was not set to emitter')

  describe '#on()', ->
    it 'should be alias for addListener', ->
      emitter = new ee.EventEmitter()
      emitter.addListener 'eventname', ->
        return

      assert.ok(typeof emitter.listeners('eventname')[0] is 'function',
        'listener was not set to emitter')

  describe '#emit()', ->
    it 'should emit the event', ->
      emitter = new ee.EventEmitter()
      handled = 0

      emitter.addListener 'eventname', (->
        handled += 1
        ).bind(this)

      emitter.emit('eventname')
      assert.ok(handled is 1, 'listener has not done once')

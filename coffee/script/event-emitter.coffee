
#
# EventEmitter -- emit event for event-driven programming
#
# All classes which emit event will extend the EventEmitter class
#
class EventEmitter
  # private _listeners
  #
  # All listeners is stored to _listeners.
  # Listener is a callback function.
  # Listeners are composed of some events (each event has Listeners array)
  #
  #     { eventName:
  #         [ [Function], [Function], ... ],
  #       eventName2:
  #         [ [Function], [Function], ... ] }
  #
  @_listeners

  # static listen_once_suffix = '-once'
  #
  # the listener which is invoked only once is stored in
  # _listeners[eventName + listen_once_suffix]
  @listen_once_suffix: '-once'

  constructor: () ->
    @_listeners = {}

  # add event listener
  #
  # @param event    : event name
  # @param listener : a function which is passed some arguments or no
  #
  addListener: (event, listener) ->
    unless @_listeners[event]?
      @_listeners[event] = []

    @_listeners[event].push(listener)

  # on event
  # alias for addListener
  on: (event, listener) ->
    this.addListener(
      event,
      listener
    )

  # do listener once on event
  #
  # @param event    : event name
  # @param listener : a function which is passed some arguments or no
  #
  once: (event, listener) ->
    this.addListener(
      event + EventEmitter.listen_once_suffix,
      listener
    )

  # remove all listener from event
  #
  # @param event : event name
  #
  removeListener: (event) ->
    # event
    if @_listeners[event]?
      delete @_listeners[event]

    # event-once
    event_once = event + EventEmitter.listen_once_suffix
    if @_listeners[event_once]
      delete @_listeners[event_once]

  # get listeners
  #
  # @return specified event listeners
  #
  listeners: (event) ->
    @_listeners[event]

  # issue the event
  #
  # @param event : event name
  # @param args : pass to listeners
  #
  emit: (event, args...) ->
    # event
    if @_listeners[event]?
      for listener in @_listeners[event]
        listener.apply(null, args)

    # event-once
    if @_listeners[event + EventEmitter.listen_once_suffix]?
      for listener in @_listeners[event + EventEmitter.listen_once_suffix]
        listener.apply(null, args)
      # the listeners invoked are deleted
      delete @_listeners[event + EventEmitter.listen_once_suffix]


try
  exports.EventEmitter = EventEmitter
catch e
  # suppress ReferenceError on the browser

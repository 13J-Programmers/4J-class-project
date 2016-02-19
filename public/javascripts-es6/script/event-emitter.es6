'use strict';

class EventEmitter {
    constructor() {
        this._listeners = {};
    }

    static get listen_once_suffix() {
        return '-once';
    }

    addListener(eventName, listener) {
        if (!this._listeners[eventName]) {
            this._listeners[eventName] = [];
        }
        this._listeners[eventName].push(listener);
    }

    on(eventName, listener) {
        this.addListener(eventName, listener);
    }

    once(eventName, listener) {
        this.addListener(eventName + EventEmitter.listen_once_suffix, listener);
    }

    removeListener(eventName) {
        deleted = false;

        // eventName
        if (this._listeners[eventName]) {
            delete this._listeners[eventName];
            deleted = true;
        }

        // eventName-once
        const eventOnce = eventName + EventEmitter.listen_once_suffix;
        if (this._listeners[eventOnce]) {
            delete this._listeners[eventOnce];
            deleted = true;
        }

        if (!deleted) {
            throw new Error(`eventName "${eventName}" is not found`);
        }
    }

    emit(eventName, ...args) {
        // eventName
        if (this._listeners[eventName]) {
            for (let listener of this._listeners[eventName]) {
                listener(...args);
            }
        }

        // eventName-once
        const eventOnce = eventName + EventEmitter.listen_once_suffix;
        if (this._listeners[eventOnce]) {
            for (let listener of this._listeners[eventOnce]) {
                listener(...args);
            }
        }
    }
}

const emitter = new EventEmitter();
emitter.on('eventName', () => {
    console.log('hello!!');
});
emitter.emit('eventName')

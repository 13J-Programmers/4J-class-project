
window.onerror = function(message, url, lineNumber) {
    if (message === 'Uncaught ReferenceError: exports is not defined') {
        return true; // prevents browser error messages
    }
};

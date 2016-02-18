var express = require('express');
var router = express.Router();

/* GET game. */
router.get('/', (req, res, next) => {
  res.render('game', { title: 'Express' });
});

module.exports = router;

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/account', function(req, res, next) {
    res.render('account', {
        title: 'Express Accounts'
    });
});

module.exports = router;

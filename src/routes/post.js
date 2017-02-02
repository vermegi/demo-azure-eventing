'use strict';

var azureSb = require('azure-sb');
const routes = require('express').Router();

var connectionString = process.env.APPSETTING_SbConnectionstring;
var queueSvc = azureSb.createServiceBusService(connectionString);

routes.post('/booking', function (req, res) {
    
    console.log('Booking recieved!');

    var msg = {
        body: JSON.stringify(req.body)
    };

    queueSvc.sendQueueMessage('bookingrequests', msg, function (error) {
        if (error) {
            console.log('error' + error);
        } else {
            console.log('Booking posted on queue. Destination: ' + req.body.destination);
        }
    });
    res.status(200).json({ message: 'Message recieved - all is good - thanks :)' });
});

module.exports = routes;
function pollHandler(data) {
    var price = parseFloat(data);
    $("span[id$='ticker']").text(price.toFixed(2));
    $("span[id$='cash']").text((price * 1.00).toFixed(2));
    $("span[id$='deposit']").text((price * 1.00).toFixed(2));
    $("span[id$='westernunion']").text((price * 1.00).toFixed(2));
    $("span[id$='moneygram']").text((price * 1.00).toFixed(2));
    $("span[id$='dwolla']").text((price * 1.00).toFixed(2));
    $("span[id$='neteller']").text((price * 1.022).toFixed(2));
}

function pollInterval() {
    var url = 'http://exchange.panamabitcoins.com/api/exchangerate'; 
    $.get(url, null, pollHandler);
}

function ticker() {
    //document.domain = 'panamabitcoins.com';
    pollInterval();
    setInterval('pollInterval()', 60000);
}

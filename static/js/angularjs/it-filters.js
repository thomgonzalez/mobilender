
integrityApp.filter('num', function() {
    return function(input) {
       return parseInt(input, 10);
    };
});

integrityApp.filter('formatMoney', function() {
    return function(value, nDecimal) {
        value = parseFloat(value);
        return value.toFixed(nDecimal).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    };
});

integrityApp.filter('isEmpty', [function() {
  return function(object) {
    return angular.equals({}, object);
  }
}]);

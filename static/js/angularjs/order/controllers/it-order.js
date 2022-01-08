(function() {
    'use strict';

    angular
        .module('mbApp')
        .controller('OrderController', OrderController);

    OrderController.$inject = [
        '$q',
        'order.dataService',
    ];

    function OrderController($q, service) {
        var vm = this;
        vm.data = [];

        /* INICIO DEL CONTROLADOR*/
        activate();

        function activate() {
            getOrders();
        }

        function getOrders(){
            vm.data = [];
          
            service.getOrders().then(function(result){
                vm.data = result;
            },function(result){
                console.log(result.data);
            });
        }
    }
})();

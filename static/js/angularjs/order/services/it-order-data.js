/*
 * Modulo: Order
 */
(function() {
    'use strict';

    angular
        .module('mbApp')
        .factory('order.dataService', dataService);

    dataService.$inject = [
        '$http',
    ];

    function dataService($http, response) {
        var API_URL_BASE = '/api/';
        
        var service = {
            getOrders: getOrders,
        };
        return service;

        /*
         * Función genérica para todas las peticiones completadas exitosamente.
         */
        function complete(response) {
            return response.data;
        }
        /*
         * Función genérica para el paso de parametros queryparams.
         */
        function parseParam(params) {
            return {
                params: params
            };
        }

        /*
         * Funciones API
        */
        function getOrders(params) {
            return $http.get(API_URL_BASE + 'orders/', parseParam(params)).then(complete);
        }

    }
})();

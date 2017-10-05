"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
var http_1 = require("@angular/http");
var core_http_query_model_1 = require("./core.http.query.model");
var core_1 = require("@angular/core");
var CoreHttpService = (function () {
    function CoreHttpService(http) {
        this.http = http;
    }
    CoreHttpService.prototype.mountEndpoint = function (query, unique) {
        if (unique === void 0) { unique = false; }
        this.endpoint = this.buildUriEndpoint((!unique) ? this.uri : this.uri + "/{id}", query.pathParams);
        this.requestParams = this.buildParams(query.queryParams);
    };
    Object.defineProperty(CoreHttpService.prototype, "uri", {
        get: function () {
            return this._uri;
        },
        set: function (uri) {
            this._uri = uri;
        },
        enumerable: true,
        configurable: true
    });
    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    CoreHttpService.prototype.cGet = function (query) {
        if (query === void 0) { query = new core_http_query_model_1.Query(); }
        this.mountEndpoint(query);
        this.requestOptions = {
            method: 'GET',
            params: this.requestParams
        };
        return this.request();
    };
    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    CoreHttpService.prototype.get = function (query) {
        if (query === void 0) { query = new core_http_query_model_1.Query(); }
        this.mountEndpoint(query, true);
        this.requestOptions = {
            method: 'GET',
            params: this.requestParams
        };
        return this.request();
    };
    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    CoreHttpService.prototype.post = function (query) {
        if (query === void 0) { query = new core_http_query_model_1.Query(); }
        this.mountEndpoint(query);
        this.requestOptions = {
            method: 'POST',
            params: this.requestParams,
            body: query.data
        };
        return this.request();
    };
    /**
     *
     * @param query
     * @returns {Promise<any>}
     */
    CoreHttpService.prototype.put = function (query) {
        if (query === void 0) { query = new core_http_query_model_1.Query(); }
        this.mountEndpoint(query, true);
        this.requestOptions = {
            method: 'PUT',
            params: this.requestParams,
            body: query.data
        };
        return this.request();
    };
    CoreHttpService.prototype.request = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.http.request(_this.endpoint, _this.requestOptions)
                .toPromise()
                .then(function (response) {
                resolve(response.json());
            })
                .catch(function (error) {
                if (error instanceof http_1.Response) {
                    var ret = error.json();
                    ret.status = error.status;
                    reject(ret);
                }
                else {
                    var errMsg = error.message ? error.message : error.toString();
                    reject(new Error(errMsg));
                }
            });
        });
    };
    /**
     *
     * @param querystring
     * @returns {URLSearchParams}
     */
    CoreHttpService.prototype.buildParams = function (querystring) {
        var search = new http_1.URLSearchParams();
        if (querystring) {
            for (var param in querystring) {
                search.set(param, querystring[param]);
            }
        }
        return search;
    };
    /**
     *
     * @param uri
     * @param params
     * @returns {string}
     */
    CoreHttpService.prototype.buildUriEndpoint = function (uri, params) {
        var url = uri;
        for (var param in params) {
            url = url.replace(new RegExp("{" + param + "}", 'g'), params[param]);
        }
        return url;
    };
    return CoreHttpService;
}());
CoreHttpService = __decorate([
    core_1.Injectable()
], CoreHttpService);
exports.CoreHttpService = CoreHttpService;

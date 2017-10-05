"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var core_http_query_model_1 = require("../http/core.http.query.model");
var core_form_component_1 = require("./core.form.component");
/**
 * componente de base para edição de um registro qualquer.
 *
 * Para adicionar validação implemente a trait Validable
 */
var CoreFormSearchComponent = (function (_super) {
    __extends(CoreFormSearchComponent, _super);
    function CoreFormSearchComponent(activatedRoute, httpService) {
        var _this = _super.call(this, activatedRoute, httpService) || this;
        _this.activatedRoute = activatedRoute;
        _this.httpService = httpService;
        return _this;
    }
    /**
     *
     * @returns {Promise<any>}
     */
    CoreFormSearchComponent.prototype.onSubmit = function () {
        var _this = this;
        this.prepareDataToSubmit();
        this.submitData.page = 1;
        this.submitData.itemsPerPage = 10;
        var params = new core_http_query_model_1.Query();
        params.queryParams = this.submitData;
        this.httpService.cGet(params).then(function (result) {
            _this.listData = result;
            console.log('data', _this.listData);
        }).catch(function (result) {
            console.log(result);
        });
    };
    /**
     *
     * @param item
     */
    CoreFormSearchComponent.prototype.prepare = function (item) {
        return Promise.resolve(this.formData);
    };
    return CoreFormSearchComponent;
}(core_form_component_1.CoreFormComponent));
exports.CoreFormSearchComponent = CoreFormSearchComponent;

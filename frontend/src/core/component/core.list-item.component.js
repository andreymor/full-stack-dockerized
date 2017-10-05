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
var core_form_search_component_1 = require("./core.form-search.component");
/**
 * classe de base para exibição de uma lista de items resolvidos.
 *
 * os dados resolvidos ficam armazenados na váriavel results.
 */
var CoreListItemComponent = (function (_super) {
    __extends(CoreListItemComponent, _super);
    function CoreListItemComponent(activatedRoute, httpService, router) {
        var _this = _super.call(this, activatedRoute, httpService) || this;
        _this.activatedRoute = activatedRoute;
        _this.httpService = httpService;
        _this.router = router;
        return _this;
    }
    /**
     *
     * @param data
     */
    CoreListItemComponent.prototype.resolveData = function (data) {
        this.listData = data;
    };
    CoreListItemComponent.prototype.onSubmit = function () {
        _super.prototype.onSubmit.call(this);
    };
    /**
     *
     * @param query
     */
    CoreListItemComponent.prototype.find = function (query) {
        var _this = this;
        // recupera os parametros atuais e altera apenas o necessário
        var currentParams = {};
        // copia current params da rota
        Object.keys(this.activatedRoute.snapshot.queryParams).forEach(function (key) {
            currentParams[key] = _this.activatedRoute.snapshot.queryParams[key];
        });
        // sobrescreve os parametros copiados com a nova configuração
        Object.keys(query).forEach(function (key) {
            currentParams[key] = query[key];
        });
        this.router.navigate([], { queryParams: currentParams });
    };
    return CoreListItemComponent;
}(core_form_search_component_1.CoreFormSearchComponent));
exports.CoreListItemComponent = CoreListItemComponent;

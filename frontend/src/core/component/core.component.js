"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * classe base para os componentes.
 *
 * O comportamento default dos componentes é que os dados precisam ser inicializados a partir de um resolver
 * este componente de base subscreve os dados da rota para resolver no componente mas delega as configurações para os
 * filhos.
 */
var CoreComponent = (function () {
    function CoreComponent(activatedRoute) {
        this.activatedRoute = activatedRoute;
    }
    CoreComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.routerSubscriber = this.activatedRoute.data.subscribe(function (content) {
            _this.resolveData(content.data);
        });
    };
    CoreComponent.prototype.ngOnDestroy = function () {
        this.routerSubscriber.unsubscribe();
    };
    return CoreComponent;
}());
exports.CoreComponent = CoreComponent;

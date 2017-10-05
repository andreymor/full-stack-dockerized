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
var core_component_1 = require("./core.component");
/**
 * Classe de base para detalhamento de um item que é resolvido da rota
 */
var CoreItemComponent = (function (_super) {
    __extends(CoreItemComponent, _super);
    function CoreItemComponent(activatedRoute) {
        var _this = _super.call(this, activatedRoute) || this;
        _this.activatedRoute = activatedRoute;
        return _this;
    }
    return CoreItemComponent;
}(core_component_1.CoreComponent));
exports.CoreItemComponent = CoreItemComponent;

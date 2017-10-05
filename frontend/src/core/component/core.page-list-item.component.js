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
var core_list_item_component_1 = require("./core.list-item.component");
var CorePageListItemComponent = (function (_super) {
    __extends(CorePageListItemComponent, _super);
    function CorePageListItemComponent(activatedRoute, router) {
        var _this = _super.call(this, activatedRoute, router) || this;
        _this.activatedRoute = activatedRoute;
        _this.router = router;
        return _this;
    }
    return CorePageListItemComponent;
}(core_list_item_component_1.CoreListItemComponent));
exports.CorePageListItemComponent = CorePageListItemComponent;

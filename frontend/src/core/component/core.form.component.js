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
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
var core_1 = require("@angular/core");
var core_item_component_1 = require("./core.item.component");
var core_form_group_1 = require("../form/core.form-group");
/**
 * componente de base para edição de um registro qualquer.
 *
 * Para adicionar validação implemente a trait Validable
 */
var CoreFormComponent = (function (_super) {
    __extends(CoreFormComponent, _super);
    function CoreFormComponent(activatedRoute, httpService) {
        var _this = _super.call(this, activatedRoute) || this;
        _this.activatedRoute = activatedRoute;
        _this.httpService = httpService;
        _this.form = new core_form_group_1.CoreFormGroup({});
        _this.onSuccess = new core_1.EventEmitter();
        return _this;
    }
    CoreFormComponent.prototype.ngOnInit = function () {
        _super.prototype.ngOnInit.call(this);
        this.form.addControl('formInput', new core_form_group_1.CoreFormGroup({}));
        this.form.submitted = false;
    };
    /**
     * @desc Resolve os dados de consulta para a rota
     * @param info
     */
    CoreFormComponent.prototype.resolveData = function (info) {
        this.formData = info;
    };
    CoreFormComponent.prototype.prepareDataToSubmit = function () {
        this.submitData = Object.assign({}, this.form.get('formInput').getRawValue());
    };
    /**
     *
     * @param item
     */
    CoreFormComponent.prototype.prepare = function (item) {
        return Promise.resolve(this.formData);
    };
    /**
     * submit do formulário
     */
    CoreFormComponent.prototype.submit = function () {
        this.form.submitted = true;
        this.onSubmit();
    };
    return CoreFormComponent;
}(core_item_component_1.CoreItemComponent));
__decorate([
    core_1.Output()
], CoreFormComponent.prototype, "onSuccess", void 0);
exports.CoreFormComponent = CoreFormComponent;

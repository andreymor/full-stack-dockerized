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
var forms_1 = require("@angular/forms");
var rxjs_1 = require("rxjs");
var CoreFormGroup = (function (_super) {
    __extends(CoreFormGroup, _super);
    /**
     *
     * @param controls
     */
    function CoreFormGroup(controls) {
        var _this = _super.call(this, controls) || this;
        /**
         *
         * @type {boolean}
         * @private
         */
        _this._submitted = false;
        _this._submittedChanges = new rxjs_1.Subject();
        _this.submittedChanges = _this._submittedChanges.asObservable();
        return _this;
    }
    Object.defineProperty(CoreFormGroup.prototype, "submitted", {
        get: function () {
            return this._submitted;
        },
        set: function (value) {
            this._submitted = value;
            this._submittedChanges.next(value);
        },
        enumerable: true,
        configurable: true
    });
    /**
     * este método sobrescreve o comportamento padrão dos componentes
     * não dando erro de compilação no módulo aot.
     *
     * @param item
     */
    CoreFormGroup.prototype.get = function (item) {
        return _super.prototype.get.call(this, item);
    };
    CoreFormGroup.prototype.markAsSubmitted = function () {
        this.submitted = true;
    };
    CoreFormGroup.prototype.markAsUnSubmitted = function () {
        this.submitted = false;
    };
    /**
     *
     */
    CoreFormGroup.prototype.validate = function () {
        var validateAll = function (controls) {
            Object.keys(controls).forEach(function (key) {
                validate(controls[key]);
            });
        };
        var validate = function (control) {
            control.markAsTouched();
            control.updateValueAndValidity();
            if (control instanceof forms_1.FormGroup || control instanceof forms_1.FormArray) {
                validateAll(control.controls);
            }
        };
        validate(this);
    };
    return CoreFormGroup;
}(forms_1.FormGroup));
exports.CoreFormGroup = CoreFormGroup;

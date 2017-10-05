import {NgModule, ModuleWithProviders, NO_ERRORS_SCHEMA} from '@angular/core';
import {CommonModule} from '@angular/common';

import {CoreHttpService} from "./http/core.http.service";
import {ValidatorControlComponent} from "./validator/components/validator-control.component";

@NgModule({
    imports: [
        CommonModule
    ],
    schemas: [NO_ERRORS_SCHEMA],
    declarations: [
        ValidatorControlComponent
    ],
    exports: [ValidatorControlComponent]
})
export class CoreModule {

    /**
     * Veja o porque foi feito assim
     */
    static forRoot(): ModuleWithProviders {
        return {
            ngModule: CoreModule,
            providers: [
                CoreHttpService
            ]
        }
    }

}

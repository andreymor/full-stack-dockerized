import {FormGroup, AbstractControl, FormControl, FormArray} from '@angular/forms';
import {Observable, Subject} from 'rxjs';

export class CoreFormGroup extends FormGroup {
    /**
     *
     * @type {boolean}
     * @private
     */
    private _submitted: boolean = false;
    /**
     *
     */
    submittedChanges: Observable<boolean>;
    /**
     *
     */
    private _submittedChanges: Subject<boolean>;


    /**
     *
     * @param controls
     */
    constructor(controls) {
        super(controls);

        this._submittedChanges = new Subject();
        this.submittedChanges = this._submittedChanges.asObservable();
    }

    set submitted(value) {
        this._submitted = value;
        this._submittedChanges.next(value);
    }

    get submitted(): boolean {
        return this._submitted;
    }

    /**
     * este método sobrescreve o comportamento padrão dos componentes
     * não dando erro de compilação no módulo aot.
     *
     * @param item
     */
    get(item): any {
        return super.get(item);
    }


    markAsSubmitted(): void {
        this.submitted = true;
    }

    markAsUnSubmitted(): void {
        this.submitted = false;
    }


    /**
     *
     */
    validate(): void {

        let validateAll = (controls) => {
            Object.keys(controls).forEach(key => {
                validate(controls[key]);
            })
        };

        let validate = (control: AbstractControl) => {
            control.markAsTouched();
            control.updateValueAndValidity();

            if (control instanceof FormGroup || control instanceof FormArray) {
                validateAll(control.controls);
            }
        }

        validate(this);
    }

}
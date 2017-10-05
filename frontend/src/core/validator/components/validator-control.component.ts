import {Component, Input, OnDestroy, AfterViewInit} from '@angular/core';
import {FormControl} from '@angular/forms';
import {Subscription} from 'rxjs';

/**
 *
 */
@Component({
    selector: 'validator-control',
    template: `<div class="form-group"
                  [ngClass]="{'has-error':isError}"> 
                        <ng-content></ng-content>
                        <span class="help-block" *ngIf="errorMessage">
                              {{errorMessage}}
                        </span>
             </div>`,
    styles: [`
        .help-block {
            color:red;
        }
        .has-error, .has-error:focus {
            border-color: #ebccd1 !important;
            outline: 0;
        }
    `]
})
export class ValidatorControlComponent implements OnDestroy, AfterViewInit {

    /**
     *
     */
    private inputSubscription: Subscription;

    /**
     *
     */
    @Input()
    control: FormControl;

    /**
     *
     * @type {boolean}
     */
    isError: boolean = false;

    /**
     *
     * @type {string}
     */
    errorMessage: string = '';

    /**
     *
     */
    clearError(): void {
        this.isError = false;
        this.errorMessage = '';
    }

    /**
     *
     */
    ngAfterViewInit() {

        this.inputSubscription = this.control.statusChanges.subscribe((state) => {
            this.clearError();

            let errors: any = this.control.errors;
            if (errors && this.control.touched) {
                this.isError = true;
                let key = Object.keys(errors)[0];
                this.errorMessage = errors[key];
            }
        });
    }

    /**
     * @desc Unsubscribing the input observable
     */
    ngOnDestroy() {
        this.inputSubscription.unsubscribe();
    }
}